<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="設備名稱" prop="name">
      <el-input v-model="dataForm.name" placeholder="設備名稱"></el-input>
    </el-form-item>
    <el-form-item label="IP地址" prop="hostname">
      <el-input v-model="dataForm.hostname" placeholder="IP地址"></el-input>
    </el-form-item>
    <el-form-item label="監聽端口" prop="port">
      <el-input v-model="dataForm.port" placeholder="監聽端口"></el-input>
    </el-form-item>
    <el-form-item label="接入帳號" prop="username">
      <el-input v-model="dataForm.username" placeholder="接入帳號"></el-input>
    </el-form-item>
    <el-form-item label="接入密碼" prop="password">
      <el-input v-model="dataForm.password" placeholder="接入密碼"></el-input>
    </el-form-item>
    <el-form-item label="設備描述" prop="description">
      <el-input v-model="dataForm.description" placeholder="設備描述"></el-input>
    </el-form-item>
    <!-- <el-form-item label="所属分类id" prop="catId">
      <el-input v-model="dataForm.catId" placeholder="所属分类id"></el-input>
    </el-form-item> -->
    <el-form-item label="选择分类" prop="catId">
      <category-cascader></category-cascader>
    </el-form-item>
    <el-form-item label="显示状态" prop="publishStatus">
      <el-switch
        v-model="dataForm.publishStatus"
        active-color="#13ce66"
        inactive-color="#ff4949"
        :active-value="1"
        :inactive-value="0"
      ></el-switch>
    </el-form-item>
    <!-- <el-form-item label="上架状态[0 - 下架，1 - 上架]" prop="publishStatus">
      <el-input v-model="dataForm.publishStatus" placeholder="上架状态[0 - 下架，1 - 上架]"></el-input>
    </el-form-item> -->
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  //这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
  //例如：import 《组件名称》 from '《组件路径》';
  import CategoryCascader from "../common/category-cascader";
  export default {
    //import引入的组件需要注入到对象中才能使用
    components: { CategoryCascader},
    props: {},
    data () {
      return {
        catPathSub: null,
        visible: false,
        dataForm: {
          id: 0,
          name: '',
          hostname: '',
          port: '',
          username: '',
          password: '',
          description: '',
          catId: '',
          publishStatus: ''
        },
        dataRule: {
          name: [
            { required: true, message: '設備名稱不能为空', trigger: 'blur' }
          ],
          hostname: [
            { required: true, message: 'IP地址不能为空', trigger: 'blur' }
          ],
          port: [
            { required: true, message: '監聽端口不能为空', trigger: 'blur' }
          ],
          // username: [
          //   { required: true, message: '接入帳號不能为空', trigger: 'blur' }
          // ],
          // password: [
          //   { required: true, message: '接入密碼不能为空', trigger: 'blur' }
          // ],
          // description: [
          //   { required: true, message: '攝像機描述不能为空', trigger: 'blur' }
          // ],
          catId: [
            { required: true, message: '所属分类不能为空', trigger: 'blur' }
          ],
          publishStatus: [
            { required: true, message: '显示状态', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/product/camerainfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.name = data.cameraInfo.name
                this.dataForm.hostname = data.cameraInfo.hostname
                this.dataForm.port = data.cameraInfo.port
                this.dataForm.username = data.cameraInfo.username
                this.dataForm.password = data.cameraInfo.password
                this.dataForm.description = data.cameraInfo.description
                this.dataForm.catId = data.cameraInfo.catId
                this.dataForm.publishStatus = data.cameraInfo.publishStatus
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/product/camerainfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'hostname': this.dataForm.hostname,
                'port': this.dataForm.port,
                'username': this.dataForm.username,
                'password': this.dataForm.password,
                'description': this.dataForm.description,
                'catId': this.dataForm.catId,
                'publishStatus': this.dataForm.publishStatus
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    },
    //生命周期 - 创建完成（可以访问当前this实例）
    created() {},
    //生命周期 - 挂载完成（可以访问DOM元素）
    mounted() {
      this.catPathSub = PubSub.subscribe("catPath", (msg, val) => {
        this.dataForm.catId = val[val.length - 1];
      });
    },
    beforeCreate() {}, //生命周期 - 创建之前
    beforeMount() {}, //生命周期 - 挂载之前
    beforeUpdate() {}, //生命周期 - 更新之前
    updated() {}, //生命周期 - 更新之后
    beforeDestroy() {
      PubSub.unsubscribe(this.catPathSub);
    }, //生命周期 - 销毁之前
    destroyed() {}, //生命周期 - 销毁完成
    activated() {} //如果页面有keep-alive缓存功能，这个函数会触发
  }
</script>

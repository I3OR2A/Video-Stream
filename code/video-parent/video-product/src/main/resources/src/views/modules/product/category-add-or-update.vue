<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="分类名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="分类名称"></el-input>
    </el-form-item>
    <el-form-item label="分类標題" prop="title">
      <el-input v-model="dataForm.title" placeholder="分类標題"></el-input>
    </el-form-item>
    <el-form-item label="分类子標題" prop="subtitle">
      <el-input v-model="dataForm.subtitle" placeholder="分类子標題"></el-input>
    </el-form-item>
    <el-form-item label="父分类id" prop="parentCid">
      <el-input v-model="dataForm.parentCid" placeholder="父分类id"></el-input>
    </el-form-item>
    <el-form-item label="层级" prop="catLevel">
      <el-input v-model="dataForm.catLevel" placeholder="层级"></el-input>
    </el-form-item>
    <el-form-item label="是否显示[0-不显示，1显示]" prop="showStatus">
      <el-input v-model="dataForm.showStatus" placeholder="是否显示[0-不显示，1显示]"></el-input>
    </el-form-item>
    <el-form-item label="排序" prop="sort">
      <el-input v-model="dataForm.sort" placeholder="排序"></el-input>
    </el-form-item>
    <el-form-item label="图标地址" prop="icon">
      <el-input v-model="dataForm.icon" placeholder="图标地址"></el-input>
    </el-form-item>
    <el-form-item label="" prop="createTime">
      <el-input v-model="dataForm.createTime" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="" prop="updateTime">
      <el-input v-model="dataForm.updateTime" placeholder=""></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          name: '',
          title: '',
          subtitle: '',
          parentCid: '',
          catLevel: '',
          showStatus: '',
          sort: '',
          icon: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          name: [
            { required: true, message: '分类名称不能为空', trigger: 'blur' }
          ],
          title: [
            { required: true, message: '分类標題不能为空', trigger: 'blur' }
          ],
          subtitle: [
            { required: true, message: '分类子標題不能为空', trigger: 'blur' }
          ],
          parentCid: [
            { required: true, message: '父分类id不能为空', trigger: 'blur' }
          ],
          catLevel: [
            { required: true, message: '层级不能为空', trigger: 'blur' }
          ],
          showStatus: [
            { required: true, message: '是否显示[0-不显示，1显示]不能为空', trigger: 'blur' }
          ],
          sort: [
            { required: true, message: '排序不能为空', trigger: 'blur' }
          ],
          icon: [
            { required: true, message: '图标地址不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          updateTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/product/category/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.name = data.category.name
                this.dataForm.title = data.category.title
                this.dataForm.subtitle = data.category.subtitle
                this.dataForm.parentCid = data.category.parentCid
                this.dataForm.catLevel = data.category.catLevel
                this.dataForm.showStatus = data.category.showStatus
                this.dataForm.sort = data.category.sort
                this.dataForm.icon = data.category.icon
                this.dataForm.createTime = data.category.createTime
                this.dataForm.updateTime = data.category.updateTime
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
              url: this.$http.adornUrl(`/product/category/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'title': this.dataForm.title,
                'subtitle': this.dataForm.subtitle,
                'parentCid': this.dataForm.parentCid,
                'catLevel': this.dataForm.catLevel,
                'showStatus': this.dataForm.showStatus,
                'sort': this.dataForm.sort,
                'icon': this.dataForm.icon,
                'createTime': this.dataForm.createTime,
                'updateTime': this.dataForm.updateTime
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
    }
  }
</script>

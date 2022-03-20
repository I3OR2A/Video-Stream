<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="攝像機名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="攝像機名称"></el-input>
    </el-form-item>
    <el-form-item label="攝像機ip" prop="hostname">
      <el-input v-model="dataForm.hostname" placeholder="攝像機ip"></el-input>
    </el-form-item>
    <el-form-item label="攝像機阜口" prop="port">
      <el-input v-model="dataForm.port" placeholder="攝像機阜口"></el-input>
    </el-form-item>
    <el-form-item label="接入帳號" prop="username">
      <el-input v-model="dataForm.username" placeholder="接入帳號"></el-input>
    </el-form-item>
    <el-form-item label="接入密碼" prop="password">
      <el-input v-model="dataForm.password" placeholder="接入密碼"></el-input>
    </el-form-item>
    <el-form-item label="攝像機描述" prop="description">
      <el-input v-model="dataForm.description" placeholder="攝像機描述"></el-input>
    </el-form-item>
    <el-form-item label="所属分类id" prop="catId">
      <el-input v-model="dataForm.catId" placeholder="所属分类id"></el-input>
    </el-form-item>
    <el-form-item label="上架状态[0 - 下架，1 - 上架]" prop="publishStatus">
      <el-input v-model="dataForm.publishStatus" placeholder="上架状态[0 - 下架，1 - 上架]"></el-input>
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
          hostname: '',
          port: '',
          username: '',
          password: '',
          description: '',
          catId: '',
          publishStatus: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          name: [
            { required: true, message: '攝像機名称不能为空', trigger: 'blur' }
          ],
          hostname: [
            { required: true, message: '攝像機ip不能为空', trigger: 'blur' }
          ],
          port: [
            { required: true, message: '攝像機阜口不能为空', trigger: 'blur' }
          ],
          username: [
            { required: true, message: '接入帳號不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '接入密碼不能为空', trigger: 'blur' }
          ],
          description: [
            { required: true, message: '攝像機描述不能为空', trigger: 'blur' }
          ],
          catId: [
            { required: true, message: '所属分类id不能为空', trigger: 'blur' }
          ],
          publishStatus: [
            { required: true, message: '上架状态[0 - 下架，1 - 上架]不能为空', trigger: 'blur' }
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
                this.dataForm.createTime = data.cameraInfo.createTime
                this.dataForm.updateTime = data.cameraInfo.updateTime
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
                'publishStatus': this.dataForm.publishStatus,
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

<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="spu_id" prop="cameraId">
      <el-input v-model="dataForm.cameraId" placeholder="spu_id"></el-input>
    </el-form-item>
    <el-form-item label="图片名" prop="name">
      <el-input v-model="dataForm.name" placeholder="图片名"></el-input>
    </el-form-item>
    <el-form-item label="图片地址" prop="url">
      <el-input v-model="dataForm.url" placeholder="图片地址"></el-input>
    </el-form-item>
    <el-form-item label="顺序" prop="sort">
      <el-input v-model="dataForm.sort" placeholder="顺序"></el-input>
    </el-form-item>
    <el-form-item label="是否默认图" prop="defaultImg">
      <el-input v-model="dataForm.defaultImg" placeholder="是否默认图"></el-input>
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
          cameraId: '',
          name: '',
          url: '',
          sort: '',
          defaultImg: '',
          createTime: '',
          updateTime: ''
        },
        dataRule: {
          cameraId: [
            { required: true, message: 'spu_id不能为空', trigger: 'blur' }
          ],
          name: [
            { required: true, message: '图片名不能为空', trigger: 'blur' }
          ],
          url: [
            { required: true, message: '图片地址不能为空', trigger: 'blur' }
          ],
          sort: [
            { required: true, message: '顺序不能为空', trigger: 'blur' }
          ],
          defaultImg: [
            { required: true, message: '是否默认图不能为空', trigger: 'blur' }
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
              url: this.$http.adornUrl(`/product/cameraimages/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.cameraId = data.cameraImages.cameraId
                this.dataForm.name = data.cameraImages.name
                this.dataForm.url = data.cameraImages.url
                this.dataForm.sort = data.cameraImages.sort
                this.dataForm.defaultImg = data.cameraImages.defaultImg
                this.dataForm.createTime = data.cameraImages.createTime
                this.dataForm.updateTime = data.cameraImages.updateTime
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
              url: this.$http.adornUrl(`/product/cameraimages/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'cameraId': this.dataForm.cameraId,
                'name': this.dataForm.name,
                'url': this.dataForm.url,
                'sort': this.dataForm.sort,
                'defaultImg': this.dataForm.defaultImg,
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

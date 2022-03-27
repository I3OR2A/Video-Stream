<template>
  <div class="app-container">
    <el-card class="box-card">
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form :inline="true">
            <el-form-item>
              <el-button type="primary" icon="el-icon-refresh" @click="getList()">更新</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-button type="primary" icon="el-icon-plus" @click="addCamera()">新建</el-button>
          <el-button type="primary" icon="el-icon-receiving" @click="dialogBatchVisible = true">批量導入</el-button>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="24">
          <el-table
            :data="list"
            border
            resizable
            tooltip-effect="dark"
            style="width: 100%"
          >
            <el-table-column
              prop="url"
              label="流"
              width="180"
              sortable
            />
            <el-table-column
              prop="remark"
              label="備註"
              width="180"
              sortable
            />
            <el-table-column
              prop="mediaKey"
              label="流水號"
              width="180"
              sortable
            />
            <el-table-column prop="enabledFlv" header-align="center" align="center" label="FLV流状态">
              <template slot-scope="scope">
                <el-switch
                  v-model="scope.row.enabledFlv"
                  active-color="#13ce66"
                  inactive-color="#ff4949"
                  :active-value="true"
                  :inactive-value="false"
                  @change="updateCameraStatus(scope.row)"
                />
              </template>
            </el-table-column>
            <el-table-column prop="enabledHls" header-align="center" align="center" label="HLS流状态">
              <template slot-scope="scope">
                <el-switch
                  v-model="scope.row.enabledHls"
                  active-color="#13ce66"
                  inactive-color="#ff4949"
                  :active-value="true"
                  :inactive-value="false"
                  @change="updateCameraStatus(scope.row)"
                />
              </template>
            </el-table-column>
            <el-table-column
              prop="action"
              label="操作"
              show-overflow-tooltip
            >
              <template slot-scope="scope">
                <el-button size="mini" type="text" @click="updateCamera(scope.row.mediaKey)">編輯</el-button>
                <el-divider direction="vertical" />
                <el-button size="mini" type="text" @click="deleteCameraInfo(scope.row.mediaKey)">刪除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
    </el-card>
    <el-dialog :title="!dataForm.mediaKey ? '新增' : '修改'" :visible.sync="dialogFormVisible">
      <el-form>
        <el-form-item required label="流" :label-width="formLabelWidth">
          <el-input v-model="dataForm.url" placeholder="请输入" />
        </el-form-item>
        <el-form-item required label="備註" :label-width="formLabelWidth">
          <el-input v-model="dataForm.remark" placeholder="请输入" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdate">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import camera from '@/api/camera'

export default {
  data() {
    return {
      page: 1, // 当前页
      limit: 10, // 每页记录数
      total: 0, // 总记录数
      dataForm: {
        id: '1',
        url: '',
        remark: '',
        enabledFlv: '1',
        enabledHls: '',
        mode: '',
        mediaKey: ''
      },
      dialogBatchVisible: false,
      dialogFormVisible: false,
      formLabelWidth: '120px',
      input: '',
      value: '',
      list: null
    }
  },
  created() {
    // 在页面渲染之前执行，一般调用methods定义的方法
    // 调用
    this.getList()
  },
  methods: { // 创建具体的方法，调用teacher.js定义方法
    // 讲师列表的方法
    getList(page = 1) {
      this.page = page
      camera.getCameraListPage(this.page, this.limit)
        .then(response => {
          // response接口返回的数据
          console.log(response)
          this.list = response.data.data
          // this.total = response.data.total
          console.log(this.list)
          // console.log(this.total)
        }) // 请求成功
        .catch(error => {
          console.log(error)
        }) // 请求失败
    }, saveOrUpdate() {
      // 添加
      // 判断修改还是添加
      // 根据teacher是否有id
      if (!this.dataForm.mediaKey) {
        // 添加
        this.addCameraInfo()
      } else {
        // 修改
        this.updateCameraInfo()
      }
    },
    addCamera() {
      this.dialogFormVisible = true
      // 清空表单
      this.dataForm = {}
    },
    // 添加讲师方法
    addCameraInfo() {
      camera.addCameraInfo(this.dataForm)
        .then(response => { // 添加成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '添加成功!'
          })
          // 清空表单
          this.dataForm = {}
          this.dialogFormVisible = false
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    },
    updateCamera(mediaKey) {
      this.dialogFormVisible = true
      camera.getCameraInfo(mediaKey)
        .then(response => { // 更新成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '查詢成功!'
          })
          // 更新表单
          this.dataForm = response.data.data
        })
        .catch(error => {
          console.log(error)
        })
    },
    updateCameraInfo() {
      camera.updateCameraInfo(this.dataForm)
        .then(response => { // 更新成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '更新成功!'
          })
          // 清空表单
          this.dataForm = {}
          this.dialogFormVisible = false
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    },
    updateCameraStatus(data) {
      camera.updateCameraStatus(data)
        .then(response => { // 更新成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '更新成功!'
          })
          // 清空表单
          this.dataForm = {}
          this.dialogFormVisible = false
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    },
    // 添加讲师方法
    deleteCameraInfo(mediaKey) {
      camera.deleteCameraInfo(mediaKey)
        .then(response => { // 刪除成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '刪除成功!'
          })
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    }
  }
}
</script>

<style>
.el-row {
  margin-bottom: 20px;
}
</style>

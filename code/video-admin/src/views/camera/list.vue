<template>
  <div class="app-container">
    <el-card class="box-card">
      <el-row :gutter="20">
        <el-col :span="24">
          <el-form :inline="true">
            <el-form-item label="主机类别">
              <el-select v-model="value" placeholder="请选择">
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="主机别名">
              <el-input v-model="input" placeholder="请输入" />
            </el-form-item>
            <el-form-item label="连接地址">
              <el-input v-model="input" placeholder="请输入" />
            </el-form-item>
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
              prop="type_id"
              label="类别"
              width="180"
              sortable
            />
            <el-table-column
              prop="hostname"
              label="主機名稱"
              width="180"
              sortable
            />
            <el-table-column
              prop="ip_address"
              label="連接地址"
              width="180"
              sortable
            />
            <el-table-column
              prop="port"
              label="端口"
              width="180"
            />
            <el-table-column
              prop="url"
              label="串流URL"
              width="180"
            />
            <el-table-column
              prop="remark"
              label="備註信息"
            />
            <el-table-column
              prop="action"
              label="操作"
              show-overflow-tooltip
            >
              <template slot-scope="scope">
                <el-button size="mini" type="text" @click="updateCamera(scope.row.pid)">編輯</el-button>
                <el-divider direction="vertical" />
                <el-button size="mini" type="text" @click="deleteCameraInfo(scope.row.pid)">刪除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
    </el-card>
    <el-dialog title="新建主机" :visible.sync="dialogFormVisible">
      <el-form>
        <el-form-item required label="主机类别" :label-width="formLabelWidth">
          <el-form :inline="true">
            <el-form-item>
              <el-select v-model="cameraInfo.type_id" placeholder="请选择">
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button>添加類別</el-button>
            </el-form-item>
            <el-form-item>
              <el-button>編輯類別</el-button>
            </el-form-item>
          </el-form>

        </el-form-item>
        <el-form-item required label="主机别名" :label-width="formLabelWidth">
          <el-input v-model="cameraInfo.hostname" placeholder="请输入" />
        </el-form-item>
        <el-form-item required label="连接地址" :label-width="formLabelWidth">
          <el-input v-model="cameraInfo.ip_address" placeholder="请输入" />
        </el-form-item>
        <el-form-item required label="串流URL" :label-width="formLabelWidth">
          <el-input v-model="cameraInfo.url" placeholder="请输入" />
        </el-form-item>
        <el-form-item required label="端口" :label-width="formLabelWidth">
          <el-input v-model="cameraInfo.port" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="独立密钥" :label-width="formLabelWidth">
          <el-button icon="el-icon-plus">點擊上傳</el-button><br>
          <span>默认使用全局密钥，如果上传了独立密钥则优先使用该密钥。</span>
        </el-form-item>
        <el-form-item label="备注信息" :label-width="formLabelWidth">
          <el-input
            v-model="cameraInfo.remark"
            type="textarea"
            :rows="2"
            placeholder="请输入模板备注信息"
          /><br>

          <span>首次验证时需要输入登录用户名对应的密码，但不会存储该密码。</span>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveOrUpdate">驗 證</el-button>
      </div>
    </el-dialog>

    <el-dialog title="批量导入" :visible.sync="dialogBatchVisible">
      <el-row :gutter="20">
        <el-col :span="24">
          <el-alert
            title=""
            type="warning"
            description="导入或输入的密码仅作首次验证使用，并不会存储密码。"
            show-icon
          />
        </el-col>
      </el-row>
      <el-form>
        <el-form-item label="模板下载" :label-width="formLabelWidth">
          <el-input v-model="input" placeholder="请输入" /><br>
          <span>请下载使用该模板填充数据后导入</span>
        </el-form-item>
        <el-form-item label="默认密码" :label-width="formLabelWidth">
          <el-input v-model="input" placeholder="请输入默认主機密码" /><br>
          <span>如果excel中密码为空则使用该密码</span>
        </el-form-item>
        <el-form-item required label="导入数据" :label-width="formLabelWidth">
          <el-button icon="el-icon-plus">點擊上傳</el-button>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogBatchVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogBatchVisible = false">导 入</el-button>
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
      cameraInfoQuery: {}, // 条件封装对象
      cameraInfo: {
        type_id: '1',
        hostname: '',
        ip_address: '',
        port: '1',
        url: '',
        remark: '',
        update_user: '1'
      },
      dialogBatchVisible: false,
      dialogFormVisible: false,
      formLabelWidth: '120px',
      input: '',
      options: [{
        value: '1',
        label: '1'
      }, {
        value: '2',
        label: '2'
      }],
      value: '',
      list: null
      // list: [{
      //   typeId: 1,
      //   hostname: 'web-01',
      //   ipAddress: '10.7.117.181',
      //   port: '2201',
      //   remark: ''
      // }, {
      //   typeId: 1,
      //   hostname: 'web-03',
      //   ipAddress: '10.7.117.182',
      //   port: '2201',
      //   remark: ''
      // }, {
      //   typeId: 1,
      //   hostname: 'web-02',
      //   ipAddress: '10.7.117.183',
      //   port: '2201',
      //   remark: ''
      // }, {
      //   typeId: 1,
      //   hostname: 'web-04',
      //   ipAddress: '10.7.117.184',
      //   port: '2201',
      //   remark: ''
      // }]
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
      camera.getCameraList()
        .then(response => {
          // response接口返回的数据
          console.log(response)
          this.list = response.data
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
      if (!this.cameraInfo.pid) {
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
      this.cameraInfo = {}
    },
    // 添加讲师方法
    addCameraInfo() {
      camera.addCameraInfo(this.cameraInfo)
        .then(response => { // 添加成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '添加成功!'
          })
          // 清空表单
          this.cameraInfo = {}
          this.dialogFormVisible = false
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    },
    updateCamera(pid) {
      this.dialogFormVisible = true
      camera.getCameraInfo(pid)
        .then(response => { // 更新成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '查詢成功!'
          })
          // 更新表单
          this.cameraInfo = response.data
        })
        .catch(error => {
          console.log(error)
        })
    },
    updateCameraInfo() {
      camera.updateCameraInfo(this.cameraInfo)
        .then(response => { // 更新成功
          // 提示信息
          this.$message({
            type: 'success',
            message: '更新成功!'
          })
          // 清空表单
          this.cameraInfo = {}
          this.dialogFormVisible = false
          // 回到列表页面  路由跳转
          this.$router.push({ path: '/camera/table' })
        })
        .catch(error => {
          console.log(error)
        })
    },
    // 添加讲师方法
    deleteCameraInfo(pid) {
      camera.deleteCameraInfo(pid)
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

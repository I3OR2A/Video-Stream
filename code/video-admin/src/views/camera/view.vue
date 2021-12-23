<template>
  <div class="app-container">
    <!-- <el-row type="flex">
      <el-col :span="8">
        <img src="https://wpimg.wallstcn.com/e7d23d71-cf19-4b90-a1cc-f56af8c0903d.png" width="100%">
      </el-col>
      <el-col :span="8">
        <img src="https://wpimg.wallstcn.com/e7d23d71-cf19-4b90-a1cc-f56af8c0903d.png" width="100%">
      </el-col>
      <el-col :span="8">
        <img src="https://wpimg.wallstcn.com/e7d23d71-cf19-4b90-a1cc-f56af8c0903d.png" width="100%">
      </el-col>
    </el-row> -->
    <el-row>
      <el-col v-for="(item, index) of list" :key="item.id" :xs="12" :sm="12" :md="12" :lg="6" class="card-col">  <!--共24份，xs超小型设备，sm小屏设备，md中屏，lg大屏-->
        <img :key="index" :src="getVideo(item.url)" width="100%">
      </el-col>
    </el-row>
  </div>
</template>

<script>
import camera from '@/api/camera'
import axios from 'axios'

export default {
  data() {
    return {
      page: 1, // 当前页
      limit: 10, // 每页记录数
      total: 0, // 总记录数
      videoUrl: process.env.VUE_APP_BASE_API + '/video_feed',
      list: []
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
    },
    getVideo(url) {
      axios.post(this.videoUrl, {
        url: url
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .app-container {
    padding: 32px;
    background-color: rgb(124, 147, 182);
    position: relative;
    .el-row{
      margin-bottom: 0px;
    }
  }
</style>

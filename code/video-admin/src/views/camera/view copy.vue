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
    <!-- <el-row>
      <el-col v-for="(item, index) of list" :key="item.id" :xs="12" :sm="12" :md="12" :lg="6" class="card-col">
        <img :key="index" :src="getVideo(item.url)" width="100%">
      </el-col>
    </el-row> -->
    <!-- 視頻 -->
    <div class="meet_left">
      <div
        v-for="(video,index) of videoList"
        :key="index"
        class="video_item"
      >
        <div class="videos">
          <video-player
            ref="videoPlayer"
            class="video-player vjs-custom-skin"
            :playsinline="true"
            :options="playerOptions"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { videoPlayer } from 'vue-video-player'
import camera from '@/api/camera'
import axios from 'axios'

export default {
  components: {
    videoPlayer
  },
  data() {
    return {
      Indexy: '4',
      page: 1, // 当前页
      limit: 10, // 每页记录数
      total: 0, // 总记录数
      videoUrl: process.env.VUE_APP_BASE_API + '/video_feed',
      list: [],
      videoList: [{
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }, {
        type: '測試',
        name: '測試',
        uid: '1',
        isSelected: false,
        isSpeak: false
      }
      ],
      playerOptions: {
        playbackRates: [0.5, 1.0, 1.5, 2.0], // 可选的播放速度
        autoplay: false, // 如果为true,浏览器准备好时开始回放。
        muted: false, // 默认情况下将会消除任何音频。
        loop: false, // 是否视频一结束就重新开始。
        preload: 'auto', // 建议浏览器在<video>加载元素后是否应该开始下载视频数据。auto浏览器选择最佳行为,立即开始加载视频（如果浏览器支持）
        language: 'zh-CN',
        aspectRatio: '16:9', // 将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）
        fluid: true, // 当true时，Video.js player将拥有流体大小。换句话说，它将按比例缩放以适应其容器。
        sources: [{
          type: 'video/mp4', // 类型
          src: '' // url地址
        }],
        poster: '', // 封面地址
        notSupportedMessage: '此视频暂无法播放，请稍后再试', // 允许覆盖Video.js无法播放媒体源时显示的默认信息。
        controlBar: {
          timeDivider: true, // 当前时间和持续时间的分隔符
          durationDisplay: true, // 显示持续时间
          remainingTimeDisplay: false, // 是否显示剩余时间功能
          fullscreenToggle: true // 是否显示全屏按钮
        }
      }
    }
  },
  created() {
    // 在页面渲染之前执行，一般调用methods定义的方法
    // 调用
    // this.getList()
  },
  mounted() {
    this.handleSelect('1')
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
    },
    handleSelect(id) {
      if (id) {
        this.Indexy = id
      }

      const aEles = document.getElementsByClassName('video_item')

      const bEles = document.getElementsByClassName('videos')

      const meetLeft = document.getElementsByClassName('meet_left')

      const vEles = meetLeft[0].getElementsByClassName('video')

      let a, b, video

      this.videoList.forEach((item, i) => {
        a = aEles[i] // 视频模块

        b = bEles[i]

        video = vEles[i] // 视频

        if (id === '0' && i < 16) {
        // 自由模式

          a.style.display = ''

          a.style.width = '24.49%'

          a.style.height = '24.7%'

          a.style.float = ''

          b.style.width = '100%'

          b.style.height = '100%'

          if (video) {
            video.style.width = '100%'

            video.style.height = '100%'
          }

          a.style.marginTop = '0%'

          a.style.marginBottom = '0%'
        } else if (id === '1') {
        // 主分屏

          if (i <= 4) {
            a.style.display = ''

            a.style.width = '30%'

            a.style.height = '24.7%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '.22%'

            a.style.float = 'left'

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'

              a.style.float = 'right'

              a.style.height = '100%'

              a.style.width = '68.9%'

              b.style.height = '100%'

              if (video) {
                video.style.height = '100%'
              }
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '2') {
        // 画中画

          if (i < 2) {
            a.style.display = ''

            a.style.width = '99.5%'

            a.style.height = '100%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '0%'

            if (i === 1) {
              a.style.backgroundColor = '#131C2C'

              a.style.width = '25%'

              a.style.height = '30%'

              a.style.position = 'absolute'

              a.style.bottom = '20px'

              a.style.right = '20px'

              b.style.height = '100%'

              if (video) {
                video.style.height = '100%'
              }
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '3') {
        // 单画面

          if (i === 0) {
            a.style.display = ''

            a.style.width = '99.5%'

            a.style.height = '100%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '0%'
          } else {
            a.style.display = 'none'
          }
        } else if (id === '4') {
        // 二分屏

          if (i < 2) {
            a.style.display = ''

            a.style.width = '49.49%'

            a.style.height = '60%'

            a.style.marginTop = '10%'

            a.style.marginBottom = '20%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'

              a.style.float = 'inherit'
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '5') {
        // 四分屏

          if (i < 4) {
            a.style.display = ''

            a.style.width = '49.49%'

            a.style.height = '49.6%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '.2%'

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'

              a.style.float = 'inherit'
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '6') {
        // L型

          if (i < 6) {
            a.style.display = ''

            a.style.width = '32.8%'

            a.style.height = '33%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '.2%'

            a.style.float = 'left'

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'

              a.style.float = 'right'

              a.style.height = '66.4%'

              a.style.width = '66.16%'

              b.style.height = '100%'

              if (video) {
                video.style.height = '100%'
              }
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '7') {
        // 反L型

          if (i < 6) {
            a.style.display = ''

            a.style.width = '32.8%'

            a.style.height = '33%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '.2%'

            a.style.float = 'right'

            if (i === 0) {
              a.style.height = '66.4%'

              a.style.width = '66.16%'

              b.style.height = '100%'

              if (video) {
                video.style.height = '100%'
              }

              a.style.float = 'left'
            }

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'
            }
          } else {
            a.style.display = 'none'
          }
        } else if (id === '8') {
        // 环型

          if (i < 11) {
            a.style.display = ''

            a.style.width = '24.49%'

            a.style.height = '33.1%'

            b.style.width = '100%'

            b.style.height = '100%'

            if (video) {
              video.style.width = '100%'

              video.style.height = '100%'
            }

            a.style.marginTop = '0%'

            a.style.marginBottom = '0%'

            if (i === 1) {
              a.style.position = 'inherit'

              a.style.bottom = '0px'

              a.style.right = '0px'

              a.style.float = 'inherit'
            } else if (i === 5) {
              a.style.width = '49.49%'
            }
          } else {
            a.style.display = 'none'
          }
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  .app-container {
    padding: 32px;
    background-color: rgb(124, 147, 182);
  }
  .meet_left {
    position: relative;
    height: auto;
    overflow: auto;
  }
  .video_item {
    display: flex;
    flex: 1;
    flex-direction: row;
  }
</style>

<template>
  <div class="app-container">
    <div id="cctv-container">
      <!-- <div class="cctv-stack">
        <a target="_blank" href="https://tw.live/cam/?id=nfbCCTV-N1-N-99.78-M">
          <span class="trigger">
            <img
              data-src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=19970"
              onerror="this.src='https://tw.live/assets/maintenance.jpg';"
              alt="國道1號(頭份交流道到新竹系統交流道)"
              class="lazyloaded"
              src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=19970"
            >
          </span>
        </a>
        <p>國道1號(頭份交流道到新竹系統交流道)</p>
      </div>
      <div class="cctv-stack">
        <a target="_blank" href="https://tw.live/cam/?id=nfbCCTV-N1-N-98-M">
          <span class="trigger">
            <img
              data-src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1980"
              onerror="this.src='https://tw.live/assets/maintenance.jpg';"
              alt="國道1號(新竹系統交流道到新竹交流道)"
              class="lazyloaded"
              src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1980"
            >
          </span>
        </a>
        <p>國道1號(新竹系統交流道到新竹交流道)</p>
      </div>
      <div class="cctv-stack">
        <a target="_blank" href="https://tw.live/cam/?id=nfbCCTV-N1-N-97.45-M">
          <span class="trigger">
            <img
              data-src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1970"
              onerror="this.src='https://tw.live/assets/maintenance.jpg';"
              alt="國道1號(新竹系統交流道到新竹交流道)"
              class="lazyloaded"
              src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1970"
            >
          </span>
        </a>
        <p>國道1號(新竹系統交流道到新竹交流道)</p>
      </div>
      <div class="cctv-stack">
        <a target="_blank" href="https://tw.live/cam/?id=nfbCCTV-N1-N-96.6-M">
          <span class="trigger">
            <img
              data-src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1960"
              onerror="this.src='https://tw.live/assets/maintenance.jpg';"
              alt="國道1號(新竹系統交流道到新竹交流道)"
              class="lazyloaded"
              src="https://cctvn.freeway.gov.tw/abs2mjpg/jpg?camera=1960"
            >
          </span>
        </a>
        <p>國道1號(新竹系統交流道到新竹交流道)</p>
      </div> -->
      <div
        v-for="(item,index) of list"
        :key="index"
        class="cctv-stack"
      >
        <video-player
          ref="videoPlayer"
          class="video-player vjs-custom-skin trigger"
          :playsinline="true"
          :options="playerOptions[index]"
          @play="onPlayerPlay($event,index)"
          @pause="onPlayerPause($event)"
        />
      </div>
    </div>

  </div>
</template>

<script>
import camera from '@/api/camera'

export default {
  components: {
  },
  data() {
    return {
      OSS_PATH: 'http://220.130.253.247:8888/hls?url=', // 阿里云OSS地址
      src: 'http://localhost:8866/live?url=rtsp://tapoadmin:tapoadmin@192.168.0.106:554/stream1',
      playerOptions: [],
      list: []
    }
  },
  computed: {
  },
  created() {
    // 在页面渲染之前执行，一般调用methods定义的方法
    // 调用
    this.getList()
  },
  methods: {
    // 讲师列表的方法
    getList(page = 1) {
      this.page = page
      camera.getCameraList()
        .then(response => {
          // response接口返回的数据
          console.log(response)
          this.list = response.data.data
          // this.total = response.data.total
          console.log(this.list)
          // 这里正常来说应该是从后台获取的数据，以下操作都是在成功的回调函数里
          for (var i = 0; i < this.list.length; i++) {
            const arrs = {
              height: '360',
              muted: true,
              autoplay: true,
              sources: [
                {
                  type: 'application/vnd.apple.mpegURL',
                  src: this.OSS_PATH + this.list[i].url // url地址
                }
              ],
              controlBar: {
                timeDivider: false, // 时间分割线
                durationDisplay: false, // 总时间
                remainingTimeDisplay: false,
                currentTimeDisplay: false, // 当前时间
                volumeControl: false, // 声音控制键
                progressControl: false, // 进度条
                playToggle: true, // 暂停和播放键
                customControlSpacer: false, // 未知,
                fullscreenToggle: true // 全屏按钮
              },
              flash: { hls: { withCredentials: false }},
              html5: { hls: { withCredentials: false }},
              poster: ''
            }
            this.playerOptions.push(arrs)
            console.log(this.OSS_PATH + this.list[i].url)
          }
        }) // 请求成功
        .catch(error => {
          console.log(error)
        }) // 请求失败
    },
    onPlayerPlay(player, index) {
      var that = this.$refs.videoPlayer
      for (let i = 0; i < that.length; i++) {
        if (i !== index) { that[i].player.pause() }
      }
    },
    onPlayerPause(player) {

    }
  }
}
</script>

<style lang="scss" scoped>
#cctv-container {
  background: #030303;
}
.cctv-stack,
.tv-stack {
  width: 25%;
  height: auto;
  position: relative;
  padding: 14.0625% 0 0;
  // background: url(assets/loading.svg) no-repeat center;
}
.cctv-stack img,
.tv-stack img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  overflow: hidden;
}
@media screen and (max-width: 1199.98px) {
  .cctv-stack,
  .tv-stack {
    width: 33.33333%;
    padding: 18.75% 0 0;
  }
}
@media screen and (max-width: 991.98px) {
  .cctv-stack,
  .tv-stack {
    width: 33.33333%;
    padding: 18.75% 0 0;
  }
}
@media screen and (max-width: 767.98px) {
  .cctv-stack,
  .tv-stack {
    width: 50%;
    padding: 28.125% 0 0;
  }
}
@media screen and (max-width: 575.98px) {
  .cctv-stack {
    width: 100%;
    padding: 56.25% 0 0;
  }
  .tv-stack {
    width: 50%;
    padding: 28.125% 0 0;
  }
}
.cctv-stack p {
  position: absolute;
  color: #fff;
  background: rgba(0, 0, 0, 0.3);
  font-size: 12px;
  z-index: 1;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  bottom: 0;
  padding: 1px 5px;
  margin: 10px;
  border-radius: 4px;
}
#cctv-container {
  display: -webkit-flex;
  display: flex;
  -webkit-flex-wrap: wrap;
  flex-wrap: wrap;
  -webkit-justify-content: left;
  justify-content: left;
  margin-top: 44px;
}
.cctv-info {
  margin-top: 44px;
}
img.cctv-image {
  width: auto !important;
  height: auto !important;
  max-height: 70vh !important;
  max-width: 100vw !important;
  min-width: 50vw;
  margin-bottom: 0.5em;
}
.trigger {
  height: 100%;
  width: 100%;
  left: 0;
  top: 0;
  position: absolute;
  z-index: 1 !important;
}
</style>

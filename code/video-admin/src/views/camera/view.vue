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
        <vue-flv-player ref="myPlayer" class="trigger" :autoplay="true" :controls="false" :muted="true" :source="OSS_PATH + item.url" />

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
      OSS_PATH: 'http://localhost:8866/live?url=', // 阿里云OSS地址
      src: 'http://localhost:8866/live?url=rtsp://tapoadmin:tapoadmin@192.168.0.106:554/stream1',
      playerOptions: {
        // playbackRates: [0.7, 1.0, 1.5, 2.0], //播放速度
        autoplay: false, // 如果true,浏览器准备好时开始回放。
        muted: false, // 默认情况下将会消除任何音频。
        loop: false, // 导致视频一结束就重新开始。
        preload: 'auto', // 建议浏览器在<video>加载元素后是否应该开始下载视频数据。auto浏览器选择最佳行为,立即开始加载视频（如果浏览器支持）
        language: 'zh-CN',
        aspectRatio: '16:9', // 将播放器置于流畅模式，并在计算播放器的动态大小时使用该值。值应该代表一个比例 - 用冒号分隔的两个数字（例如"16:9"或"4:3"）
        fluid: true, // 当true时，Video.js player将拥有流体大小。换句话说，它将按比例缩放以适应其容器。
        sources: [
          {
            type: 'video/x-flv', // 这里的种类支持很多种：基本视频格式、直播、流媒体等，具体可以参看git网址项目
            src: 'http://localhost:8866/live?url=rtsp://tapoadmin:tapoadmin@192.168.0.106:554/stream1' // url地址
          }
        ],
        hls: true,
        poster: 'http://localhost:49154/images/live.jpg', // 你的封面地址
        width: document.documentElement.clientWidth, // 播放器宽度
        notSupportedMessage: '此视频暂无法播放，请稍后再试', // 允许覆盖Video.js无法播放媒体源时显示的默认信息。
        controlBar: {
          timeDivider: true,
          durationDisplay: true,
          remainingTimeDisplay: false,
          fullscreenToggle: true // 全屏按钮
        }
      },
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
          // console.log(this.total)
        }) // 请求成功
        .catch(error => {
          console.log(error)
        }) // 请求失败
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

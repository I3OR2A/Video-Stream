<template>
  <div class="app-container">
    <!-- <div class="cctv-stack">
      <a target="_blank" href="https://tw.live/youtube/?id=gwyqqjsyx">
        <span class="trigger">
          <img data-src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg" onerror="this.src='https://tw.live/assets/maintenance.jpg';" alt="觀霧遊憩區即時影像" class=" lazyloaded" src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg">
        </span>
      </a>
      <p>觀霧遊憩區即時影像</p>
    </div> -->

    <div
      v-for="(video,index) of list"
      :key="index"
      class="video_item"
    >
      <div class="videos">
        <!-- <iframe src="http://localhost:49154//player.html?autoplay=1" name="restreamer-player" scrolling="no" frameborder="0" webkitallowfullscreen="true" mozallowfullscreen="true" allowfullscreen="true" /> -->
        <!-- <img data-src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg" onerror="this.src='https://tw.live/assets/maintenance.jpg';" alt="觀霧遊憩區即時影像" class=" lazyloaded" src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg"> -->
        <!-- <img data-src="http://localhost:49154/images/live.jpg" onerror="this.src='https://tw.live/assets/maintenance.jpg';" alt="觀霧遊憩區即時影像" class=" lazyloaded" src="http://localhost:49154/images/live.jpg"> -->
        <!-- <VideoComponent
          class=" lazyloaded"
          sources="http://localhost:49154/hls/live.stream.m3u8"
        /> -->
        <video-player
          ref="videoPlayer"
          class="video-player vjs-custom-skin"
          :playsinline="true"
          :options="playerOptions"
          @play="onPlayerPlay($event)"
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
            type: 'application/x-mpegURL', // 这里的种类支持很多种：基本视频格式、直播、流媒体等，具体可以参看git网址项目
            src: 'http://localhost:49154/hls/live.stream.m3u8' // url地址
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
      list: null
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
          this.list = response.data
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
  .app-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: left;
    background: #030303;
  }
  .cctv-stack {
    width: 25%;
    height: auto;
    position: relative;
  }
    @media only screen and (max-width: 767px) {
  .video_item {
      width: 100%;
      height: auto;
      margin-top: 0%;
      margin-bottom: 0%;
      border-color:#aaaaee;
      border-style:solid;
      border-width:3px;
  }
  }
    @media only screen and (min-width: 768px) {
  .video_item {
      width: 50%;
      height: auto;
      margin-top: 0%;
      margin-bottom: 0%;
      border-color:#aaaaee;
      border-style:solid;
      border-width:3px;
  }
  }

  @media only screen and (min-width: 992px) {
  .video_item {
      width: 33%;
      height: auto;
      margin-top: 0%;
      margin-bottom: 0%;
      border-color:#aaaaee;
      border-style:solid;
      border-width:3px;
  }
  }

  @media only screen and (min-width: 1200px) {
  .video_item {
      width: 25%;
      height: auto;
      margin-top: 0%;
      margin-bottom: 0%;
      border-color:#aaaaee;
      border-style:solid;
      border-width:3px;
  }
  }
  .videos {
      width: 100%;
      height: auto;
  }
  .lazyloaded {
      width: 100%;
      height: auto;
  }
</style>

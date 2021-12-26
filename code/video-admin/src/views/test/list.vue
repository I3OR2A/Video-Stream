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
      v-for="(video,index) of videoList"
      :key="index"
      class="video_item"
    >
      <div class="videos">
        <img data-src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg" onerror="this.src='https://tw.live/assets/maintenance.jpg';" alt="觀霧遊憩區即時影像" class=" lazyloaded" src="https://img.youtube.com/vi/W9rFx-mEqU0/hqdefault_live.jpg">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  components: {
  },
  data() {
    return {
      sourcesList: [
        // 这里有的数据为空是我故意处理 因为如果数据源始终相同那么video就不会有切换的感觉
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        '',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4',
        'http://vjs.zencdn.net/v/oceans.mp4'
      ],
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
      }]
    }
  },
  computed: {
  },
  methods: {
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

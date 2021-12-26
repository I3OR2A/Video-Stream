<template>
  <div v-loading="loading" class="neiyi">
    <!-- <video
      muted // 是否静音
      autoplay // 是否自动播放
      controls="controls" // 加载的loading
      width="100%" // video的宽度100%
      style="object-fit: fill;" // 播放内容的填充video标签 如果想让视频填充容器 这个与width="100%"都要使用。切记 不能写成style="width: "100%";object-fit: fill;"
      :id="id"
      @mouseover="onmouseover"
    ></video>-->
    <video
      :id="id"
      muted
      autoplay
      width="100%"
      style="object-fit: fill;"
      @mouseover="onmouseover"
      @playing="playing"
    />
    <div v-if="isOver" class="zhezhao">
      <svg
        t="1618369758864"
        class="icon"
        viewBox="0 0 1024 1024"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        p-id="9575"
        width="32"
        height="32"
        @click="screenshot"
      >
        <path
          d="M597.17 348.21c-91.474 0-165.634 74.622-165.634 166.679s74.16 165.415 165.634 165.415 163.861-73.359 163.861-165.415-72.386-166.678-163.86-166.678z m335.761-182.85H798.114c-35.89-45.982-77.59-99.245-78.172-99.245h-294.04c-0.69 0-42.837 53.264-79.094 99.244H91.088c-49.173 0-89.021 39.849-89.021 89.022v519.073c0 49.173 39.848 89.02 89.021 89.02h841.843c49.173 0 89.022-39.847 89.022-89.02V254.38c0-49.173-39.85-89.022-89.022-89.022zM225.86 390.802c-28 0-50.68-22.68-50.68-50.654 0-27.999 22.68-50.68 50.68-50.68 27.973 0 50.653 22.681 50.653 50.68 0 27.973-22.68 50.654-50.653 50.654z m374.103 346.64c-123.115 0-226.61-100.435-226.61-224.303 0-123.89 103.495-224.302 226.61-224.302 123.09 0 221.655 100.411 221.655 224.302 0 123.867-98.565 224.303-221.655 224.303z"
          fill="#707070"
          p-id="9576"
        />
      </svg>
      <svg
        t="1618370024595"
        class="icon"
        viewBox="0 0 1024 1024"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        p-id="16302"
        width="32"
        height="32"
        @click="fullScreen"
      >
        <path
          d="M628.053333 628.053333a32 32 0 0 1 45.226667 0l158.72 158.634667V693.333333l0.298667-4.352A32 32 0 0 1 896 693.333333v181.333334l-0.341333 3.84a21.333333 21.333333 0 0 1-20.992 17.493333h-181.333334l-4.352-0.298667a32 32 0 0 1-27.648-31.701333l0.298667-4.352a32 32 0 0 1 31.701333-27.648h93.44l-158.72-158.72-3.114666-3.584a32 32 0 0 1 3.114666-41.642667z m-232.106666 0a32 32 0 0 1 3.114666 41.642667l-3.114666 3.584-158.72 158.72h93.44a32 32 0 0 1 31.701333 27.648l0.298667 4.352a32 32 0 0 1-27.648 31.701333L330.666667 896H149.333333a21.333333 21.333333 0 0 1-20.992-17.493333L128 874.666667v-181.333334a32 32 0 0 1 63.701333-4.352l0.298667 4.352v93.354667l158.72-158.634667a32 32 0 0 1 45.226667 0zM874.666667 128a21.333333 21.333333 0 0 1 20.992 17.493333L896 149.333333v181.333334a32 32 0 0 1-63.701333 4.352L832 330.666667V237.312L673.28 395.946667a32 32 0 0 1-48.341333-41.642667l3.114666-3.584 158.72-158.72h-93.44a32 32 0 0 1-31.701333-27.648L661.333333 160a32 32 0 0 1 27.648-31.701333L693.333333 128h181.333334zM330.666667 128l4.352 0.298667a32 32 0 0 1 27.648 31.701333l-0.298667 4.352a32 32 0 0 1-31.701333 27.648H237.226667l158.72 158.72 3.114666 3.584a32 32 0 0 1-48.341333 41.642667L192 237.312V330.666667l-0.298667 4.352A32 32 0 0 1 128 330.666667V149.333333l0.341333-3.84A21.333333 21.333333 0 0 1 149.333333 128h181.333334z"
          p-id="16303"
          fill="#707070"
        />
      </svg>
    </div>
  </div>
</template>

<script>
import flv from 'flv.js'
export default {
  props: ['id', 'sources'],
  data() {
    return {
      player: null,
      isOver: false,
      timer: null,
      loading: true
    }
  },
  watch: {
    sources: {
      deep: true,
      // immediate: true,// 千万不要加这一行代码加里就完蛋
      handler(newSources, oldSources) {
        var videoElement = document.getElementById(this.id)
        if (!videoElement) {
          if (this.player !== null) {
            // attachMediaElement(mediaElement: HTMLMediaElement): void;
            this.player.pause()
            this.player.unload()
            this.player.detachMediaElement()
          }
        }
        if (!this.loading) {
          this.loading = true
        }
        if (flv.isSupported()) {
          this.player = flv.createPlayer({
            type: 'mp4/flv',
            url: newSources
            // url: this.sources
          })
        }
        videoElement = document.getElementById(this.id)
        this.player.attachMediaElement(videoElement)
        this.player.load()
      }
    }
  },
  created() {
    if (flv.isSupported()) {
      this.player = flv.createPlayer({
        type: 'mp4/flv',
        // url: "http://vjs.zencdn.net/v/oceans.mp4"
        url: this.sources
      })
    }
  },
  mounted() {
    var videoElement = document.getElementById(this.id)
    this.player.attachMediaElement(videoElement)
    this.player.load()
    this.player.play()
  },
  methods: {
    flv_destroy() {
      if (this.player !== null) {
        // attachMediaElement(mediaElement: HTMLMediaElement): void;
        this.player.pause()
        this.player.unload()
        this.player.detachMediaElement()
        this.player.destroy()
        this.player = null
      }
    },
    screenshot() {
      // 截屏
      console.log('==-=-=截屏-=-==')
    },
    fullScreen() {
      // 全屏展示
      console.log('==-=-=全屏-=-==')
    },
    onmouseover() {
      if (this.timer) {
        clearTimeout(this.timer)
      }
      this.isOver = true
      this.timer = setTimeout(() => {
        this.isOver = false
      }, 2000)
    },
    playing() {
      if (this.loading) {
        this.loading = false
      }
    }
  },
  destroy() {
    this.flv_destroy()
  }
}
</script>

<style>
.neiyi {
  position: relative;
  display: flex;
  flex: 1;
}
.zhezhao {
  position: absolute;
  display: flex;
  bottom: 0;
  left: 0;
  right: 0;
  height: 50px;
  background-color: rgba(0, 0, 0, 0.5);
  align-items: center;
  justify-content: flex-end;
  padding-right: 10px;
  z-index: 100;
}
</style>

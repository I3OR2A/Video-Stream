<template>
  <div>
    <video ref="videoPlayer" class="video-js" />
  </div>
</template>

<script>
import {videoPlayer} from 'vue-video-player'

export default {
  name: 'VideoPlayer',
  props: {
    options: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      player: null
    }
  },
  mounted() {
    this.player = videoPlayer(this.$refs.videoPlayer, this.options, function onPlayerReady() {
      console.log('onPlayerReady', this)
    })
  },
  beforeDestroy() {
    if (this.player) {
      this.player.dispose()
    }
  }
}
</script>

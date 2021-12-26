<template>
  <div class="contains">
    <div class="element_top">
      <div v-for="i in howmany" :key="i" class="horizontal">
        <div v-for="j in howmany" :key="j" class="vertical">
          <VideoComponent
            v-if="howmany !== 0 && sourcesList[((i - 1) * howmany + j - 1)+oneScreentotalNum*pages]"
            :id="'videoid'+((i - 1) * howmany + j - 1)+pages"
            :sources="sourcesList[((i - 1) * howmany + j - 1)+oneScreentotalNum*pages]"
          />
          <div
            v-if="howmany === 0 || !sourcesList[((i - 1) * howmany + j - 1)+oneScreentotalNum*pages]"
            class="changeScreen"
          >
            <span style="color: #ffffff;font-size: 18px;">无视频流</span>
          </div>
        </div>
      </div>
    </div>
    <div class="element_bottom">
      <div class="bottom_left">
        <svg
          t="1618369670414"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="8453"
          width="32"
          height="32"
          @click="oneScreen"
        >
          <path
            d="M1024 0v1024H0V0h1024z m-60.235294 60.235294H60.235294v903.529412h903.529412V60.235294z m-60.235294 60.235294v783.058824H120.470588V120.470588h783.058824z"
            p-id="8454"
            :fill="howmany == 1 ? '#36c6d3' : '#707070'"
          />
        </svg>
        <svg
          t="1618369605381"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="7639"
          width="32"
          height="32"
          @click="fourScreen"
        >
          <path
            d="M1024 0v1024H0V0h1024z m-60.235294 60.235294H60.235294v903.529412h903.529412V60.235294zM481.882353 542.117647v361.411765H120.470588V542.117647h361.411765z m421.647059 0v361.411765H542.117647V542.117647h361.411765zM481.882353 120.470588v361.411765H120.470588V120.470588h361.411765z m421.647059 0v361.411765H542.117647V120.470588h361.411765z"
            p-id="7640"
            :fill="howmany == 2 ? '#36c6d3' : '#707070'"
          />
        </svg>
      </div>
      <div class="bottom_right">
        <svg
          t="1618369927365"
          class="icon"
          viewBox="0 0 1280 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="15081"
          width="32"
          height="32"
          @click="upPage"
        >
          <path
            d="M554.64194766 141.21142578c12.7922058 0 23.71810889 4.50508117 32.77152968 13.64501953 9.05960107 9.01016235 13.59558082 19.95460487 13.59558153 32.6911924 0 13.13209511-4.57305933 24.07653833-13.76861596 32.95692466l-245.12832642 245.09124757 722.35794044 0c12.79838538 0 23.6933899 4.50508117 32.81478882 13.64501953 9.02252221 9.01016235 13.56468224 19.94842529 13.56468224 32.69119239 0 12.87872339-4.54216003 23.81698632-13.57086182 32.82714867-9.11521935 9.01016235-20.01022315 13.51524353-32.80242896 13.51524353L342.11829606 558.27441406l245.12214685 245.09124757c9.19555664 9.01016235 13.76861596 19.95460487 13.76861596 32.95074439 0 12.8725431-4.53598046 23.81698632-13.59558153 32.82714867-9.05342078 9.13993836-19.98550415 13.64501953-32.77152968 13.64501953-13.0517578 0-24.03945947-4.50508117-32.95692467-13.38546753L197.2573804 545.01872253C188.34609476 535.62541175 183.87809244 524.54501367 183.87809244 512.06179786c0-12.60681153 4.46800232-23.55125404 13.37928796-32.95074439l324.42764259-324.37820459C530.8620402 145.84628296 541.84356156 141.33502221 554.64194766 141.33502221L554.64194766 141.21142578z"
            p-id="15082"
            fill="#707070"
          />
        </svg>
        <span>{{ `第${pages + 1}页/共${totalpage}页` }}</span>
        <svg
          disabled="false"
          t="1618369943342"
          class="icon"
          viewBox="0 0 1280 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="15318"
          width="32"
          height="32"
          @click="nextPage"
        >
          <path
            d="M469.35805234 882.78857422c-12.7922058 0-23.71810889-4.50508117-32.77152968-13.64501953-9.05960107-9.01016235-13.59558082-19.95460487-13.59558153-32.6911924 0-13.13209511 4.57305933-24.07653833 13.76861596-32.95692466l245.12832642-245.09124757-722.35794044 0c-12.79838538 0-23.6933899-4.50508117-32.81478882-13.64501953-9.02252221-9.01016235-13.56468224-19.94842529-13.56468224-32.69119239 0-12.87872339 4.54216003-23.81698632 13.57086182-32.82714867 9.11521935-9.01016235 20.01022315-13.51524353 32.80242896-13.51524353L681.88170394 465.72558594l-245.12214685-245.09124757c-9.19555664-9.01016235-13.76861596-19.95460487-13.76861596-32.95074439 0-12.8725431 4.53598046-23.81698632 13.59558153-32.82714867 9.05342078-9.13993836 19.98550415-13.64501953 32.77152968-13.64501953 13.0517578 0 24.03945947 4.50508117 32.95692467 13.38546753L826.7426196 478.98127747C835.65390524 488.37458825 840.12190756 499.45498633 840.12190756 511.93820214c0 12.60681153-4.46800232 23.55125404-13.37928796 32.95074439l-324.42764259 324.37820459C493.1379598 878.15371704 482.15643844 882.66497779 469.35805234 882.66497779L469.35805234 882.78857422z"
            p-id="15319"
            fill="#707070"
          />
        </svg>
      </div>
    </div>
  </div>
</template>

<script>
import VideoComponent from './components/VideoComponent'
export default {
  components: {
    VideoComponent
  },
  data() {
    return {
      howmany: 1,
      pages: 0,
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
      ]
    }
  },
  computed: {
    oneScreentotalNum() {
      return Math.pow(this.howmany, 2)
    },
    totalpage() {
      return Math.ceil(this.sourcesList.length / Math.pow(this.howmany, 2))
    }
  },
  methods: {
    oneScreen() {
      this.restScreen()
      setTimeout(() => {
        // 为什么这里要加 setTimeout ?
        this.howmany = 1 // 因为如果你不这样那么在切换屏幕的时候左上角的第一个屏幕就会使用缓存
      }, 50) // 如果你不信可以试试去掉setTimeout 我是被坑了好久。
    },
    fourScreen() {
      this.restScreen()
      setTimeout(() => {
        this.howmany = 2
      }, 50)
    },
    restScreen() {
      this.pages = 0
      this.howmany = 0
    },
    upPage() {
      if (this.pages > 0) {
        this.pages -= 1
      }
    },
    nextPage() {
      const pageSize = Math.ceil(
        this.sourcesList.length / this.oneScreentotalNum
      )
      if (this.pages < pageSize - 1) {
        this.pages += 1
      }
    }
  }
}
</script>

<style>
* {
  margin: 0;
}
#app {
  position: absolute;
  display: flex;
  top: 5px;
  bottom: 5px;
  left: 5px;
  right: 5px;
  margin-top: 0;
}
.contains {
  display: flex;
  flex-direction: column;
  flex: 1;
}
.element_top {
  display: flex;
  flex: 1;
  flex-direction: column;
}
.element_bottom {
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-left: 1px;
  padding-right: 1px;
}
.bottom_left {
  height: 50px;
  width: 80px;
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}
.bottom_right {
  height: 50px;
  width: 200px;
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}
.horizontal {
  display: flex;
  flex: 1;
  flex-direction: row;
  margin-bottom: 1px;
}
.vertical {
  display: flex;
  flex: 1;
  margin-right: 1px;
}
.changeScreen {
  display: flex;
  flex: 1;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.8);
}
</style>

import Vue from 'vue'

import 'normalize.css/normalize.css' // A modern alternative to CSS resets
import VideoPlayer from 'vue-video-player'
import 'videojs-flash'
require('video.js/dist/video-js.css')
require('vue-video-player/src/custom-theme.css')

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import locale from 'element-ui/lib/locale/lang/zh-TW' // lang i18n

import '@/styles/index.scss' // global css

import App from './App'
import store from './store'
import router from './router'

import '@/icons' // icon
import '@/permission' // permission control
import vueFlvPlayer from 'vue-flv-player'
import vueHlsPlayer from 'vue-hls-player'

/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online ! ! !
 */
if (process.env.NODE_ENV === 'production') {
  const { mockXHR } = require('../mock')
  mockXHR()
}

// set ElementUI lang to EN
Vue.use(ElementUI, { locale })
const hls = require('videojs-contrib-hls')
Vue.use(hls)
Vue.use(VideoPlayer)
Vue.use(vueFlvPlayer)
Vue.use(vueHlsPlayer)
// 如果想要中文版 element-ui，按如下方式声明
// Vue.use(ElementUI)

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})

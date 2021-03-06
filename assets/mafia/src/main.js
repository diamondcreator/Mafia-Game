import Vue from 'vue'

import VueRouter from 'vue-router'

import routes from './routes/route'

Vue.use(VueRouter)

const router = new VueRouter({ routes }) 

const app = new Vue({
  router
}).$mount('#app')
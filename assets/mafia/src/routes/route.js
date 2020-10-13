// Pages
import Home from '../pages/Home.vue'
import NotFound from '../pages/404/404.vue'

import Room from '../pages/Room.vue'


//middlewares
import auth from '../middlewares/auth'

const routes = [
    {
        path: '/',
        component: Home
    },
    {
      path: '/secreto',
      component: Home,
      //proteção de rota
      beforeEnter: auth
    },
    {
      path: '/room',
      component: Room,
      //proteção de rota
      beforeEnter: auth
    },
    { 
      path: '*',
      component: NotFound
    }
  ]

export default routes



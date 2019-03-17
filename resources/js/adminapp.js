require('./bootstrap');
window.Vue = require('vue');
// import routes 
import router from './adminrouter'
// initial components for loading vue app


// IMPORT THE STORE 

import store from './adminstore';
import iView from 'iview';
import 'iview/dist/styles/iview.css';
import locale from 'iview/dist/locale/en-US';
Vue.use(iView, { locale });


import common from './common'
Vue.mixin(common)

Vue.component('adminmain', require('./components/admin.vue'));


const app = new Vue({
    el: '#app', 
    router,
    store,
});

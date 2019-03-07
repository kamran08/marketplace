require('./bootstrap');
window.Vue = require('vue');
// import routes 
import router from './router'
// initial components for loading vue app


// IMPORT THE STORE 

import store from './store';
import iView from 'iview';
import 'iview/dist/styles/iview.css';
import locale from 'iview/dist/locale/en-US';
Vue.use(iView, { locale });


import common from './common'
Vue.mixin(common)

Vue.component('mainapp', require('./components/mainapp.vue'));
// Vue.component('mainapp', require('./components/mainapp.vue').default);

const app = new Vue({
    el: '#app', 
    router,
    store,
});

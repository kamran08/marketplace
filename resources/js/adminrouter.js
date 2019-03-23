import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router);
import user from './components/admin/user.vue';
import servicelist from './components/admin/servicelist.vue';
import category from './components/admin/category.vue';
import newbookinglist from './components/admin/newbookinglist.vue';
import bookinglist from './components/admin/bookinglist.vue';
import completedList from './components/admin/completedList.vue';
import canclebookinglist from './components/admin/canclebookinglist.vue';


// Job Insert Components
import editJobDescription from './components/admin/editJobDescription.vue';
import editJobExtraService from './components/admin/jobExtraService.vue';
import editJobImage from './components/admin/jobImage.vue';
import editJobTag from './components/admin/jobTag.vue';



const defaultroutes = [
    {
        path: '/admin',
        name: 'user',
        title: 'admin',
        component: user,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    // {
    //     path: '/admin/user',
    //     name: 'user',
    //     title: 'user',
    //     component: user,
    //     meta: {
    //         guest : true,
    //         allowedUserType: ['All']
    //     }
    // },
    {
        path: '/admin/editJobDescription/:id',
        name: 'editJobDescription',
        title: 'Edit service',
        component: editJobDescription,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/editJobImage/:id',
        name: 'editJobImage',
        title: 'Edit service',
        component: editJobImage,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/editJobExtraService/:id',
        name: 'editJobExtraService',
        title: 'Edit service',
        component: editJobExtraService,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/editJobTag/:id',
        name: 'editJobTag',
        title: 'Edit service',
        component: editJobTag,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },





    {
        path: '/admin/servicelist',
        name: 'servicelist',
        title: 'service list',
        component: servicelist,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    
    {
        path: '/admin/category',
        name: 'category',
        title: 'category list',
        component: category,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/newbookinglist',
        name: 'newbookinglist',
        title: 'new booking list',
        component: newbookinglist,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/bookinglist',
        name: 'bookinglist',
        title: 'Running booking list',
        component: bookinglist,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/completedList',
        name: 'completedList',
        title: 'Completed booking list',
        component: completedList,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
    {
        path: '/admin/canclebookinglist',
        name: 'canclebookinglist',
        title: 'Cancled booking list',
        component: canclebookinglist,
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },

    {
        path: '*',
        redirect: { name: 'user' },
        title: 'Not found',
        meta: {
            guest : true,
            allowedUserType: ['All']
        }
    },
]



/**
 * IMPORT ALL ROUTES DYNAMICALLY FROM THE MODULES FOLDERS....
*/

var allRoutes = []
import camelCase from 'lodash/camelCase'
const requireModule = require.context('./modules', true, /\.js$/)
const importedRoutes = []

requireModule.keys().forEach(fileName => {
    let str = fileName.split('/')
    str = str[1]
    if (fileName === `./${str}/router/index.js`){
        const moduleName = camelCase(
            fileName.replace(/(\.\/|\.js)/g, '')
        )
        importedRoutes.push(...requireModule(fileName).default)
    }
})

/**
 * CONCAT ALL THE IMPORTED ROUTES WITH MAIN ROUTES...
 */
allRoutes = allRoutes.concat(defaultroutes,importedRoutes)
const routes = allRoutes

export default new Router({
    mode: 'history',
    routes
})



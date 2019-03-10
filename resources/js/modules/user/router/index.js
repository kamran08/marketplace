
import testpage from '../pages/test_page.vue'
import login from '../pages/login.vue'
import register from '../pages/register.vue'
import check from '../pages/check.vue'
import jobpost from '../pages/jobPost.vue'
import jobDescription from '../pages/jobPostStep/jobDescription.vue'
import jobExtraService from '../pages/jobPostStep/jobExtraService.vue'
import jobPostStep from '../pages/jobPostStep/jobDescription.vue'
import jobImage from '../pages/jobPostStep/jobImage.vue'
import jobTag from '../pages/jobPostStep/jobTag.vue'

import order from '../pages/order.vue'
import profile from '../pages/profile.vue'
import details from '../pages/details.vue'
const routes = [
    {
        path: '/user-test',
        name: 'test page names',
        component: testpage,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'This is a test page',
        }

    },
    {
        path: '/login',
        name: 'login',
        component: login,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Login',
        }

    },
    {
        path: '/register',
        name: 'register',
        component: register,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'register',
        }

    },
    {
        path: '/jobpost',
        name: 'jobpost',
        component: jobpost,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'register',
        }

    },
    {
        path: '/jobDescription',
        name: 'jobDescription',
        component: jobDescription,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobDescription',
        }

    },
    {
        path: '/jobExtraService/:id',
        name: 'jobExtraService',
        component: jobExtraService,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobExtraService',
        }

    },
    {
        path: '/jobImage/:id',
        name: 'jobImage',
        component: jobImage,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobImage',
        }

    },
    {
        path: '/jobTag/:id',
        name: 'jobTag',
        component: jobTag,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobTag',
        }

    },
    {
        path: '/order',
        name: 'order',
        component: order,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'order',
        }

    },
    {
        path: '/profile',
        name: 'profile',
        component: profile,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'profile',
        }

    },
    {
        path: '/details',
        name: 'details',
        component: details,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'details',
        }

    },

]

export default routes

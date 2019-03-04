
import testpage from '../pages/test_page.vue'
import login from '../pages/login.vue'
import register from '../pages/register.vue'
import check from '../pages/check.vue'
import jobpost from '../pages/jobPost.vue'
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
        path: '/check',
        name: 'check',
        component: check,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'check',
        }

    },
]

export default routes

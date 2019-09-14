
import testpage from '../pages/test_page.vue';
import check from '../pages/check.vue';
import jobpost from '../pages/jobPost.vue';

import marketplace from '../pages/marketplace.vue';

// Job Insert Components
import jobDescription from '../pages/jobPostStep/jobDescription.vue';
import jobExtraService from '../pages/jobPostStep/jobExtraService.vue';
import jobImage from '../pages/jobPostStep/jobImage.vue';
import jobTag from '../pages/jobPostStep/jobTag.vue';

// Job Insert Components
import editJobDescription from '../pages/editJobPostStep/editJobDescription.vue';
import editJobExtraService from '../pages/editJobPostStep/jobExtraService.vue';
import editJobImage from '../pages/editJobPostStep/jobImage.vue';
import editJobTag from '../pages/editJobPostStep/jobTag.vue';

import jobPostStep from '../pages/jobPostStep/jobDescription.vue';
import order from '../pages/order.vue';
import sprofile from '../pages/seller/profile.vue';
import bprofile from '../pages/buyer/profile.vue';
import details from '../pages/details.vue';
import terms from '../pages/terms.vue';
import about from '../pages/about.vue';
import faq from '../pages/faq.vue';
import notification from '../pages/notification.vue';


// Auth Components
import login from '../pages/Auth/login.vue';
import register from '../pages/Auth/register.vue';
import getEmail from '../pages/Auth/getEmail.vue';
import passwordreset from '../pages/Auth/passwordreset.vue';
import contract from '../pages/contract.vue';
import activated from '../pages/activated.vue';

const routes = [

    {
        path: '/editJobDescription/:id',
        name: 'editJobDescription',
        component: editJobDescription,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobDescription',
        }

    },
    {
        path: '/contact',
        name: 'contract',
        component: contract,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'contract',
        }

    },
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
        path: '/faq',
        name: 'faq',
        component: faq,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'faq',
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
        path: '/notification',
        name: 'notification',
        component: notification,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Notification',
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
        path: '/marketplace',
        name: 'marketplace',
        component: marketplace,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Marketplace',
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
        path: '/order/:id',
        name: 'order',
        component: order,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'order',
        }

    },
    {
        path: '/sprofile/:id',
        name: 'sprofile',
        component: sprofile,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'profile',
        }

    },

    {
        path: '/bprofile/:id',
        name: 'bprofile',
        component: bprofile,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'profile',
        }

    },
    {
        path: '/details/:id',
        name: 'details',
        component: details,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'details',
        }

    },
    {
        path: '/terms',
        name: 'terms',
        component: terms,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Terms&Condition',
        }

    },
    {
        path: '/about',
        name: 'about',
        component: about,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'About',
        }

    },
    {
        path: '/getEmail',
        name: 'getEmail',
        component: getEmail,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Password Reset',
        }

    },
    {
        path: '/passwordreset/:token',
        name: 'passwordreset',
        component: passwordreset,
        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Password Reset Field',
        }

    },

    {
        path: '/editJobExtraService/:id',
        name: 'editJobExtraService',
        component: editJobExtraService,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobExtraService',
        }

    },
    {
        path: '/editJobImage/:id',
        name: 'editJobImage',
        component: editJobImage,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobImage',
        }

    },
    {
        path: '/editJobTag/:id',
        name: 'editJobTag',
        component: editJobTag,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'jobTag',
        }

    },
    {
        path: '/activated',
        name: 'activated',
        component: activated,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'Account Activated!',
        }

    },


]

export default routes

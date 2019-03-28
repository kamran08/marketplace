
import messanger from '../pages/messanger.vue';

const routes = [

    {
        path: '/messanger',
        name: 'messanger',
        component: messanger,

        meta: {
            guest: true,
            allowedUserType: ['All'],
            title: 'messanger',
        }

    },
    

]

export default routes

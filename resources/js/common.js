import { mapActions, mapGetters } from 'vuex';
export default {
    data() {
        return {
            siteUri: 'http://bookingmarket.localhost/',
            selectdata:''

        }
    },
    computed: {
        ...mapGetters({
           // authInfo: 'getAuth',
            tagInfo:'getFlag',
            searchData:'getSearchData',
            LinkFlagTab: 'getTabInfo',
            User_id: 'getUser_id',
            getService_id:'getService_id'
        }),
    },
    created() {
        // console.log(authInfo)
    },
    methods: {
        /**
         * 
         * @param {*} method, call method
         * @param {*} url , api url
         * @param {*} dataObj, payload
         */
        async callApi(method, url, dataObj) {
            try {

                let data = await axios({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    method: method,
                    url: '/app/' + url,
                    data: dataObj
                })
                return data

            } catch (e) {

                return e.response
            }
        },

        i(msg, i = 'Hey!') {
            this.$Notice.info({
                title: i,
                desc: msg
            });
        },
        s(msg, i = 'Great!') {
            this.$Notice.success({
                title: i,
                desc: msg
            });
        },
        w(msg, i = 'Hi!') {
            this.$Notice.warning({
                title: i,
                desc: msg
            });
        },
        e(msg, i = 'Oops!') {
            this.$Notice.error({
                title: i,
                desc: msg
            });
        },
        swr() {
            this.$Notice.error({
                title: 'Oops',
                desc: 'Something went wrong, please try again later'
            });
        },
        ns(title) {
            this.$Message.success(title);
        },
        ni(title) {
            this.$Message.info(title);
        },
        nw(title) {
            this.$Message.warning(title);
        },
        ne(title) {
            this.$Message.error(title);
        },
        nswr() {
            this.$Message.error('Something went wrong, please try again later');
        },
    }
} 
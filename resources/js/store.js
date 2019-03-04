/**
 * THIS IS THE DEFAULT STORE...
 */
import Vue from 'vue';
import Vuex from 'vuex';
import teststore from './modules/test/store'
// load modules 
import modules from './modules'
Vue.use(Vuex);

export default new Vuex.Store({
    modules,
    state: {
        authUser:'of',
        tabFlag: 1,
        searhData:'this is search data'
       
    },
    //started getter
    getters: {
        authUser(state) {
            return state.authUser
        },
        getSearchData(state) {
            return state.searhData
        },
        getFlag(state) {
            return state.tabFlag
        }
    },// getter end

    //mutation started
    mutations: {
        setFlag: (state, payload) => {
            state.tabFlag = payload;
        },
        setSearchData: (state, payload) => {
            state.searhData = payload;
        },

        setAuth: (state, payload) => {
            state.authUser = payload;
        },
        pushcartitem: (state, payload) => {
            state.cartsdata.push(payload);
        },
        pushadditem: (state, payload) => {

            state.products.push({ name: payload[0], price: payload[1] })
            //state.cartsdata.push(payload);
        },
        pushsellitem: (state, payload) => {
            for (var i = 0; i < payload.length; i++) {
                state.selldata.push(payload[i])
            }
            if (state.cartsdata.length > 0) {
                state.cartsdata = [];
            }
        }
    },/// mutation end

    //action started 
    actions: {
        setFlag: (context, payload) => {
            context.commit('setFlag', payload)
        },
        setSearchData: (context, payload) => {
            context.commit('setSearchData', payload)
        },
        setAuth: (context, payload) => {
            context.commit('setAuth', payload)
        },

        reducePrice: (context, payload) => {
            setTimeout(function () {
                context.commit('reducePrice', payload)
            }, 2000)
        },
        pushcartitem: (context, payload) => {
            context.commit('pushcartitem', payload)
        },

    }// action end 


});
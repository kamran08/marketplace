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
        searhData:'this is search data',
        TabInfo:1,
        User_id:''
       
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
        },
        getTabInfo(state) {
            return state.TabInfo
        },
        getUser_id(state) {
            return state.User_id
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
        setTabInfo: (state, payload) => {
            state.TabInfo = payload;
        },
        setUser_id: (state, payload) => {
            state.User_id = payload;
        },
      
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
        setTabInfo: (context, payload) => {
            context.commit('setTabInfo', payload)
        },
        setUser_id: (context, payload) => {
            context.commit('setUser_id', payload)
        },

    

    }// action end 


});
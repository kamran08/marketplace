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
        User_id:'1',
        Service_id:1,
        userType:''
        
       
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
        },
        getService_id(state) {
            return state.Service_id
        },
        getUserType(state) {
            return state.userType
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
        setService_id: (state, payload) => {
            state.Service_id = payload;
        },
        setUserType: (state, payload) => {
            state.userType = payload;
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
        setService_id: (context, payload) => {
            context.commit('setService_id', payload)
        },
        setUserType: (context, payload) => {
            context.commit('setUserType', payload)
        },

    

    }// action end 


});
/**
 * THIS IS THE DEFAULT STORE...
 */
import Vue from 'vue';
import Vuex from 'vuex';
import teststore from './modules/test/store'
import chat from './modules/chat/store'
// load modules 
import modules from './modules'
Vue.use(Vuex);

export default new Vuex.Store({
    modules,
    state: {
        authUser: false,
        tabFlag: 1,
        searhData:'this is search data',
        TabInfo:1,
        notificationCount:0,
        notificationData:[],
        msgNotificationCount:0,
        msgNotificationData:[],
        
        
       
    },
    //started getter
    getters: {
        getAuthUser(state) {
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
        },
        getNoficationCount(state) {
            return state.notificationCount
        },
        getNoficationData(state) {
            return state.notificationData
        },
        getMsgNoficationCount(state) {
            return state.msgNotificationCount
        },
        getMsgNoficationData(state) {
            return state.msgNotificationData
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
        setNoficationCount: (state, payload) => {
            state.notificationCount += payload;
        },
        setNoficationData: (state, payload) => {
            state.notificationData = payload;
        },
        setNoficationFirst: (state, payload) => {
            state.notificationCount = payload;
        },
        setMsgNoficationData: (state, payload) => {
            state.msgNotificationData = payload;
        },
        setMsgNoficationFirst: (state, payload) => {
            state.msgNotificationCount = payload;
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
        setNoficationCount: (context, payload) => {
            context.commit('setNoficationCount', payload)
        },
        setNoficationData: (context, payload) => {
            context.commit('setNoficationData', payload)
        },
        setNoficationFirst: (context, payload) => {
            context.commit('setNoficationFirst', payload)
        },
        setMsgNoficationData: (context, payload) => {
            context.commit('setMsgNoficationData', payload)
        },
        setMsgNoficationFirst: (context, payload) => {
            context.commit('setMsgNoficationFirst', payload)
        },

    

    }// action end 


});
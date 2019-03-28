export default {
   
    state: {
        testModuleNumber: 34344,
        chatListing:[],
        currentBuddyIndex: 0,
        currentBuddyInfo: {},
        chat:[],
        isTyping:false,
    },
    getters: {
        // getFlag(state) {
        //     return state.tabFlag
        // }
        getChatListing(state){
            return state.chatListing
        },
        getCurrentBuddy(state){
            return state.currentBuddyIndex
        },
        getCurrentBuddyInfo(state){
            return state.currentBuddyInfo
        },
        getChat(state){
            return state.chat
        },
        getIsTyping(state){
            return state.isTyping
        },
    },
    mutations: {
        // setFlag: (state, payload) => {
        //     state.tabFlag = payload;
        // },
        setChatListing:(state,payload) =>{
            state.chatListing = payload
        },
        setCurrentBuddy:(state,payload) =>{
            state.currentBuddyIndex = payload
        },
        setCurrentBuddyInfo:(state,payload) =>{
            state.currentBuddyInfo = payload
        },
        setChat:(state,payload) =>{
            state.chat = payload
        },
        setIsTyping:(state,payload) =>{
            state.isTyping = payload
        },
        pushNewChat (state,data) {
            state.chat.push(data)
            state.chatListing[data.index].msg=data.msg
        },
        newComingChat(state,data){
           
            for(let d of data){
                console.log(state.currentBuddyInfo)
                if(d.con_id== state.currentBuddyInfo.con_id){
                    state.chat.push(d);
                    state.chatListing[state.currentBuddyIndex].msg=d.msg
                }
            }
            
            
        }

    },
    actions: {
        // setFlag: (context, payload) => {
        //     context.commit('setFlag', payload)
        // },
        setChatListing:(state,payload) =>{
            state.commit('setChatListing', payload)
        },
        setCurrentBuddy:(state,payload) =>{
            state.commit('setCurrentBuddy', payload)
        },
        setCurrentBuddyInfo:(state,payload) =>{
            state.commit('setCurrentBuddyInfo', payload)
        },
        setChat:(state,payload) =>{
            state.commit('setChat', payload)
        },
        setIsTyping:(state,payload) =>{
            state.commit('setIsTyping', payload)
        },
        pushNewChat:(state,payload) =>{
            state.commit('pushNewChat', payload)
        },
        newComingChat:(state,payload) =>{
            state.commit('newComingChat', payload)
        },
    }
}
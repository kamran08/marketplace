<template>
	<div>
    <headsSction/>
	
   
     	<transition name="component-fade" mode="out-in">
        <router-view :key="$route.fullPath"></router-view>
    </transition>
      <footsSction/>
	</div>


</template>


<script>
import headsSction from './pages/header.vue'
import footsSction from './pages/footer.vue'
import { mapGetters } from 'vuex'
export default {
  
   components:{
      headsSction,
      footsSction,
    },
    methods:{
      async getNotificationCount(){
         const res1 = await this.callApi('get',`getAllNotifications`)
          if(res1.status===200){
            this.$store.dispatch('setNoficationFirst', (res1.data.notificationCount))
            //this.$store.dispatch('setNoficationData', (res1.data.notificationData))
            //this.$store.dispatch('setMsgNoficationFirst', (res1.data.msgNotificationCount))
            this.$store.dispatch('setMsgNoficationData', (res1.data.msgNotificationData))
            this.$store.dispatch('setMsgNoficationData', (res1.data.msgNotificationData))
             
            if(this.$route.name!='messanger'){
              
              return;
            }
            
            if(res1.data.msgNotificationData.length>0){
              let data = res1.data.msgNotificationData
              this.$store.dispatch('chatStoreIndex/newComingChat', (data))
              this.updateSeen({con_id: this.currentBuddy.con_id})
            }
           

          }
          else{
            this.swr()
          }
      },
       async updateSeen(updateData){
            console.log("here I am")
            const res = await this.callApi('post','update-seen',updateData)
            if(res.status!==200){
                this.swr();
            }
        }
    },
    computed:{
       ...mapGetters({
           currentBuddy: 'chatStoreIndex/getCurrentBuddyInfo',
           currentBuddyIndex : 'chatStoreIndex/getCurrentBuddy',
           
       }),
    },
    created(){
      this.$store.dispatch('setAuth', (window.authUser));
      if(this.authInfo){
        setInterval(()=>{
        this.getNotificationCount()
      },5000)
      }
      
     
      
    },

}
</script>

<style>

</style>





<style>

.component-fade-enter-active, .component-fade-leave-active {
  transition: opacity .5s ease;
}
.component-fade-enter, .component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.progress-linear {
    
    position: absolute;
    top: -15px;
   
}
</style>
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
            this.$store.dispatch('setNoficationData', (res1.data.notificationData))
          }
          else{
            this.swr()
          }
      }
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
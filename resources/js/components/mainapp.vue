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
  created(){
     this.$store.dispatch('setAuth', (window.authUser));
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
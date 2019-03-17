<template>
	<div>
   
		<transition name="component-fade" mode="out-in">
        <router-view></router-view>
    </transition>
     
	</div>


</template>


<script>

export default {
 
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
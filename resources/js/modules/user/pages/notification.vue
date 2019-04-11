<template>
    <div>
        <div class="container">
            <div class="_box_shadow2 terms ">
                <p class="_title3">Notification</p>

                <ul v-if="list.length" >
                    <li class="notification_main" v-for="(item,index) in list" :key="index"  @click="isSeen(item)" ><a >{{item.user.name}} {{item.notitxt}}</a></li>
                </ul>
            </div>
        </div>
    </div>
</template>


<script>
export default {
 data(){
     return{
         list:[],
     }
 },
 methods:{
     async getAllNofication(){
         const res = await this.callApi('get','getNoficationAllData')
         if(res.status === 200){
             this.list = res.data
         }
         else{
             this.swr();
         }
     },
      async isSeen(item){
			this.$router.push(item.url)
			if(item.seen){
				const res = await this.callApi('put','updateNotification',{id:item.id})
				if(res.status!==200){
					this.swr();
				}
			}
		},
 },
 created(){
     this.getAllNofication();
 }
}
</script>

<style>

</style>


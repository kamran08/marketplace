<template>
   <div>

     <headsSction/>
            <!-- <input v-model="datas.userName" placeholder="userName">
        <input v-model="datas.email" placeholder="email">
        <input v-model="datas.password" placeholder="password">
        <input v-model="confirmPassword" placeholder="confirmPassword">
        <input v-model="datas.userType" placeholder="userType">
         <button @click='check'> post </button> -->
         <!-- <router-link :to="{ name: 'login'}" class="navbar-brand"> login </router-link> -->
    

        <home1 v-if="this.tagInfo==1" />
        <!-- <home1 v-if="pageTwo"/> -->
        <service v-if="this.tagInfo==2"/>
        <!-- <service v-if="pageOne"/> -->
       
        <footsSction/>
         
                                 
   </div>
</template>

<script>
import headsSction from './pages/header.vue'
import footsSction from './pages/footer.vue'
import home1 from './pages/home1.vue'
import service from './service.vue'
    export default {
        components:{
            headsSction,
            footsSction,
            home1,
            service
        },
        data(){
            return{message:'',
                datas:{
                    userName:'',
                    email:'',
                    userType:'',
                     password:'',
                   
                },
               confirmPassword:'',
            }
        },
        created(){
         
        }
        ,
        mounted() {
            console.log('Component mounted.')
        },
        methods:{
            async check(){
                if(this.datas.password === this.confirmPassword){
                        const res = await this.callApi('post', 'ok', this.datas)
                        if(res.status==200){
                             this.$router.push('/login');
                        } 
                }
           

            },


        },
        
    }
</script>

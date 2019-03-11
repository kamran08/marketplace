<template>
   <div>
        <home1 v-if="this.tagInfo==1" />
        <service v-if="this.tagInfo==2"/>
       
         
                                 
   </div>
</template>

<script>

import home1 from './pages/home1.vue'
import service from './service.vue'
    export default {
        components:{
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

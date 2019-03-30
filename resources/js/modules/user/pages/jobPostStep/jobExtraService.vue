<template>
   <div>
   <div class="_job_step">
      <div class="container-fluid">
         <div class="row justify-content-center">
            <div class="col-12 col-md-6">
               <div class="_job_step_main _job_extra">
                  <div class="_job_step_title">
                     <h3 class="_title">POST A JOB</h3>
                  </div>

                  <div class="_1steps_all">
                        <Steps :current="2">
                            <Step title="step 1" content=""></Step>
                            <Step title="step 2" content=""></Step>
                            <Step title="step 3" content=""></Step>
                            <Step title="step 4" content=""></Step>
                        </Steps>
                  </div>

                  <div class="_login_input_group">
                     <p class="_1steps_input_title" >EXTRA</p>
                     <div class="_login_input" v-for="(item,index) in items" :key="index">
                        <div class="_login_input_inp"  >
                            <div class="_login_input_group">
                                <input class="_login_input_inp_field" v-model="item.serviceName" placeholder="title" type="text">
                            </div>

                            <div class="_login_input_group">
                                <input class="_login_input_inp_field" v-model="item.servicePrice" placeholder="price" type="text">
                            </div>
                           <!-- <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a> -->
                           <Button type="primary" @click="delate(index)"><i class="fas fa-times"></i></Button>
                        </div>
                     </div>
                     <div v-if="ok">
                         <div class="_login_input_group">
                                <input class="_login_input_inp_field" v-model="formdata.serviceName" placeholder="title" type="text">
                         </div>

                         <div class="_login_input_group">
                                <input class="_login_input_inp_field" v-model="formdata.servicePrice" placeholder="price" type="text"> 
                         </div>
                        <!-- <Button type="primary" @click="delate(-2)"><i class="fas fa-times"></i></Button> -->
                     </div>
                     <Button @click="add"> add </Button>
                     <Button @click="clear" v-if="ok"> clear</Button>
                     <div class="_login_input_button">
                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Next</button>
                        <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                serviceName:'',
                servicePrice:'',
                service_id:''
            },
            items:[],
          itemName:'',
          itemPrice:'',
          ok:false,
          alljobs:'',
          visible: false,
          catagory:'catagory',
        updatevalue:{
            id:this.$route.params,
            num:4
       }

        }
    },
    created(){
            this.formdata.service_id = this.$route.params.id;
     },
    methods:{
        delate(index){
           this.items.splice(index, 1); 
        },
        
        join(){
            // this.$router.push({name: 'jobTag',params: {id:this.router}})
            if(this.formdata.serviceName!='' && this.formdata.servicePrice!='' && this.formdata.service_id!=''){
                this.i('if you want to add current item please hit on add button or clear')
            }
            // //this.items.push({serviceName:this.formdata.serviceName,servicePrice:this.formdata.servicePrice,service_id:this.formdata.service_id})
            else if(this.items.length>0){
                this.insertExtra(this.items);
                this.$router.push({name: 'jobTag',params: {id:this.formdata.service_id}})
               // this.$store.dispatch('setTabInfo',4);
            }
            else{
                this.updateSeriveStep(this.updatevalue);
                this.$router.push({name: 'jobTag',params: {id:this.formdata.service_id}})
            }
              
        },
        add(){
            if(this.ok==1){
                if(this.formdata.serviceName=='' || this.formdata.servicePrice=='' ){
                    this.e('please fill all this item')
                    return;  
                }
                 else {
                    this.items.push({serviceName:this.formdata.serviceName,servicePrice:this.formdata.servicePrice,service_id:this.formdata.service_id})
                    this.formdata.serviceName=''
                    this.formdata.servicePrice=''
                    this.ok=false   
                    this.s('added a new extra service')
                 }
            }
            else{
                this.ok=true
            }
         },
        async insertExtra(data){
            const res = await this.callApi('post', 'add-extra-services', data)
            if(res.status===200){  
                this.s('your extra service has been added')
            }
            else{
                this.swr()
            }
        },
        // async instantdata(){
        //         const res1 = await this.callApi('get', `intant-extra-data`)
        // },
        clear(){
            this.formdata.serviceName = ''
            this.formdata.servicePrice = ''
            this.formdata.service_id = ''
        },
        async updateSeriveStep(data){
            const res1 = await this.callApi('post', 'updateSeriveStep', data)
        }
        
    },
    async created(){
        this.formdata.service_id = this.$route.params.id
        const res = await this.callApi('get',`get-courrent-step/${this.formdata.service_id}`)
        if(res.status===200){
           if(res.data.nextStep==3){
            this.$router.push({name: 'jobExtraService', params: {id:this.formdata.service_id}})
            return
           }
           else if(res.data.nextStep==4){
             this.$router.push({name: 'jobTag',params: {id:this.formdata.service_id}})
             return
           }
           else if(res.data.nextStep!=2){
             this.$router.push({name: 'jobDescription'})
             return
           }
        }

        else{
           this.swr();
        }
         
      
        this.i("Please click on add button , if you have additional services");
    
    },
   

}
</script>

<style>

</style>

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
                        <div class="_login_input_inp">
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
                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Update</button>
                        <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
                        <p class="_banner_post_title"> <button class="_btn _login_input_button_btn _bg"  type="button"><router-link :to="{name: 'editJobTag' , params:{id:service_id}}"  >Next</router-link></button></p>
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
            service_id:''

        }
    },
    created(){
            this.formdata.service_id = this.$route.params.id;
     },
    methods:{
        delate(index){
           this.items.splice(index, 1); 
        },
        async join(){
            if(this.formdata.serviceName!='' && this.formdata.servicePrice!='' && this.formdata.service_id!=''){
                this.i('if you want to add current item please hit on add button or clear')
            }
            else if(this.items.length>0){
                this.insertExtra(this.items);
            }
            else{
                const res = await this.callApi('post','deleteExtraServices',{service_id:this.service_id})
                if(res.status===200){
                    this.i('this service has no extra service')
                }
                else{
                    this.swr();
                }
                
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
            for(let d of data){
                delete d.id
                delete d.created_at
                delete d.updated_at
            }
            const res = await this.callApi('post', 'UpdateExtraServices', data)
            if(res.status===200){  
                this.s('your extra service has been added')
            }
            else{
                this.swr()
            }
        },
        clear(){
            this.formdata.serviceName = ''
            this.formdata.servicePrice = ''
            this.formdata.service_id = ''
        },
        
     async getExtraServicebyId(){
           const res = await this.callApi("get",`getExtraServicebyId/${this.$route.params.id}`)
           if(res.status===200){
              this.items = res.data
             
           }
           else{
              this.swr();
           }
        }
       
    },
   async created(){
          this.service_id = this.$route.params.id
         this.getExtraServicebyId();  
    }
   

}
</script>

<style>

</style>

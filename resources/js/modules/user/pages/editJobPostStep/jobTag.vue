<template>
   <div>
   <div class="_job_step">
      <div class="container-fluid">
         <div class="row justify-content-center">
            <div class="col-12 col-md-6">
               <div class="_job_step_main">
                  <div class="_job_step_title">
                     <h3 class="_title">POST A JOB</h3>
                  </div>
                  
                  <div class="_1steps_all">
                     <Steps :current="3">
                        <Step title="step 1" content=""></Step>
                        <Step title="step 2" content=""></Step>
                        <Step title="step 3" content=""></Step>
                        <Step title="step 4" content=""></Step>
                     </Steps>
                  </div>


                  <div class="_login_input_group">
                     <p class="_1steps_input_title">TAGS</p>
                     <div class="_login_input">
                        <div class="_login_input_inp">
                           <!-- <input class="_login_input_inp_field" v-model="formdata.tagName" placeholder="Tag" type="text"> -->
                           <Input class="_login_input_inp_field" type="text"  ref = "input"  placeholder="Tag" v-model="tagName" @keyup.enter.native="add()"/>
                        </div>
                     </div>

                     <template v-if="items.length>0" >
                        <div  v-for="(item,i) in items" :key="i"> 
                           {{item.tagName}} <i class="fa fa-times" @click="delate(i)"></i>
                        </div>
                     </template>
                     
                     <div>
                     </div>
                     <div class="_login_input_button">
                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">update</button>
                        <button v-if="authInfo.userType==4" class="_btn _login_input_button_btn _bg"  type="button"><router-link :to="{ name: 'dashboard', params: { id : authInfo.id}}">Finish</router-link></button>
                        <button v-if="authInfo.userType!=4" class="_btn _login_input_button_btn _bg"  type="button"><router-link :to="{ name: 'details', params: { id : this.service_id}}">Finish</router-link></button>
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
            items:[],
            service_id:'',
            tagName:''
        }
    },
    methods:{
         async join(){
            if(this.items.length>0){
                      for(let d of this.items){
                        delete d.id
                        delete d.created_at
                        delete d.updated_at
                     }
                    const res = await this.callApi('post', 'updateTag', this.items)
                    if(res.status==200){
                    this.s('Your tags have been successfully updated!');
                    
                    }
                    else{
                        this.swr();
                    }
            }
            else{
               let  data = {
                  service_id: this.service_id
               }
               const res = await this.callApi('post','deleteTagService',data)
               if(res.status===200){
                 this.s('Your tags have been successfully updated!');
               }
               else{
                  this.swr();
               }

            }
        },
         add(){
            if(this.tagName==''){
                this.i('please enter the tag name')
                return
            }
            this.items.push({service_id:this.service_id,tagName:this.tagName})
            this.tagName = ''
         },
         delate(index){
           this.items.splice(index, 1);   
         },
     async getTagbyId(){
           const res = await this.callApi("get",`getTagbyId/${this.$route.params.id}`)
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
         this.getTagbyId();  
    }
   

}
</script>

<style>

</style>

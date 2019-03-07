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
                     <div v-for="(item,i) in items" :key="i" v-if="items.length>0"> 
                        {{item.tagName}} <i class="fa fa-times" @click="delate(i)"></i>
                     </div>
                     <div>
                     </div>
                     <div class="_login_input_button">
                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Finish</button>
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
                    const res = await this.callApi('post', 'add-tag', this.items)
                    if(res.status==200){
                    this.s('Your tags have been successfully added!');
                    this.$router.push({name: '/'})

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
   },
   async created(){
         this.service_id = this.$route.params.id
         const res = await this.callApi('get',`get-courrent-step/${this.service_id}`)
         if(res.status===200){
            if(res.data.nextStep==3){
               this.$router.push({name: 'jobExtraService', params: {id:this.service_id}})
               return
            }
            else if(res.data.nextStep==4){
               this.$router.push({name: 'jobTag',params: {id:this.service_id}})
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
         this.i('please enter the tag name')
   }
   

}
</script>

<style>

</style>

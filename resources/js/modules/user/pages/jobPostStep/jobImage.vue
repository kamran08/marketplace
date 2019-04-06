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
                                <Steps :current="1">
                                     <Step title="Service details" content=""></Step>
                                    <Step title="Upload Images" content=""></Step>
                                    <Step title="Add Extra" content=""></Step>
                                    <Step title="Tags" content=""></Step>
                                </Steps>
                            </div>
                  <div class="_login_input_group">
                     <div class="_1steps_img _1steps_shadow">
                        <img class="_1steps_img_pic" :src="active.imageUrl"  title="">
                     </div>
                     <div class="_1steps_img_select">
                        <ul class="_1steps_img_select_pic">
                           <template v-if="uploads.length" >
                              <li class="_1steps_shadow  " v-for="(item,index) in uploads" :key="index" :class="(index==1)?'_1steps_img_select_active' : ''" >
                                 <img :src="item.imageUrl"  title="">
                                 <p class="_1steps_cencel _1steps_shadow">
                                    <i class="fas fa-plus" @click="removeImage(index)" ></i>
                                 </p>
                              </li>
                           </template>
                           <li class="_1steps_add">
                              <Col span="24" class="dream-input-main" >
                              <Upload
                                 ref="upload"
                                 type="drag"
                                 name="img"
                                 :show-upload-list="listMethod" 
                                 :with-credentials="true"
                                 :headers="crfObj"
                                 :on-success="handleSuccess"
                                 :format="['jpg','jpeg','png']"
                                 :max-size="2048"
                                 action="/app/getServiceImage">
                                 <!-- action="/app/uploadServiceImages"> -->
                                 <div  >
                                    <i class="fas fa-plus"></i>
                                 </div>
                              </Upload>
                              </Col>
                           </li>
                        </ul>
                     </div>
                     <div class="_login_input_button">
                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Next Step</button>
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

            listMethod:false,
            items:[],
            itemName:'',
            itemPrice:0,
            ok:0,
            alljobs:'',
            visible: false,
            catagory:'catagory',
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
            service_id:'',
            uploads:[],
            active:{
                imageUrl:"/uploads/default.png",
            }

        }
    },
    methods:{
      async removeImage(index){
         // const res  = await this.callApi('post',"unlinkImage",{imageLink: this.uploads[index].imageUrl})
         // if(res.status===200){
         //    this.uploads.splice(index,1);
         //    this.active.imageUrl = "/uploads/default.png";
         // }

         this.uploads.splice(index,1);
         this.active.imageUrl = "/uploads/default.png";
         
       },
        async join(){
            if(!this.uploads.length){
                this.i("You must upload atleast 1 Photo!");
                return;
            }
            for (const i of this.uploads) {
                i.service_id = this.service_id;
            }
            const res1 = await this.callApi('post',"saveServiceImage",this.uploads)
            if(res1.status===200){
                this.s("Images uploaded Successfully!")
                this.$router.push({name: 'jobExtraService', params: {id:this.service_id}})
               // this.$store.dispatch('setTabInfo',this.LinkFlagTab+1);
            }
            else{
                this.swr();
            }
            console.log(this.uploads);
        },
        handleSuccess(res, file){
            console.log(res);
             this.active.imageUrl = res;
             this.uploads.push({imageUrl:this.active.imageUrl});
            console.log(res);
        },
       
    },
   async created(){
          this.service_id = this.$route.params.id
           const res = await this.callApi('get',`get-courrent-step/${this.service_id}`)
           if(res.status===200){
           if(res.data.nextStep==3){
            this.$router.push({name: 'jobExtraService', params: {id:this.service_id}})
           }
           else if(res.data.nextStep==4){
             this.$router.push({name: 'jobTag',params: {id:this.service_id}})
           }
           else if(res.data.nextStep!=2){
             this.$router.push({name: 'jobDescription'})
           }
        }

        else{
           this.swr();
        }
         
      
        //this.i("Please upload your Service Images");
    }

}
</script>

<style>

</style>

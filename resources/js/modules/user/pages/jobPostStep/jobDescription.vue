<template>
<div>
   <div class="_job_step">
      <div class="container-fluid">
         <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-6">
               <div class="_job_step_main">
                  <div class="_job_step_title">
                     <h3 class="_title">POST A JOB</h3>
                  </div>
                  
                  <div class="_1steps_all">
                     <Steps :current="LinkFlagTab-1">
                        <Step title="step 1" content=""></Step>
                        <Step title="step 2" content=""></Step>
                        <Step title="step 3" content=""></Step>
                        <Step title="step 4" content=""></Step>
                     </Steps>
                  </div>

                  <div class="_1steps_from">
                     <form>
                        <div class="">
                           <div class="row">
                              <div class="col-12 col-md-6">
                                 <div class="_login_input_group">
                                    <div class="_login_input">
                                       <div class="_login_input_inp">
                                          <Input v-model="formdata.title" placeholder="Job title" type="text" />
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <div class="col-12 col-md-6">
                                 <div class="_login_input">
                                    <div class="_login_input_inp">
                                       <Select  v-model="formdata.cat_id">
                                          <Option v-for="(item,index) in alljobs" :value="item.id" :key="index">{{ item.catName }}</Option>
                                       </Select>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_login_input_group">
                           <div class="_login_input">
                              
                              <div class="_login_input_inp select_time">
                                 <div class="row">
                                    <div class="col-12 col-md-12 _dis_flex">
                                       <p class="_1steps_input_title" >Service days</p>
                                    </div>
                                 </div>
                                 <div class="row align-items-center" v-for="(item,index) in formdata.servicingTime" :key="index">
                                    <div class="col-3 col-md-3">
                                      <Checkbox v-model="item.isOn">{{item.day}}</Checkbox>
                                    </div>

                                    <div class="col-3 col-md-3">
                                       <TimePicker v-model="item.startTime" format="HH:mm" type="time" placement="bottom-end" placeholder="Start Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-3">
                                       <TimePicker v-model="item.endTime" format="HH:mm" type="time" placement="bottom-end" placeholder="End Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-3">
                                       <Input class="_login_input_inp_field" v-model="item.duration" placeholder="Duration" type="number"></Input>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_login_input_group">
                           <p class="_1steps_input_title" >DESCRIPTION</p>
                           <div class="_login_input">
                              <div class="_login_input_inp">
                                 <Input v-model="formdata.description" type="textarea" :autosize="{minRows: 4,maxRows: 5}" placeholder="DESCRIPTION" />
                              </div>
                           </div>
                        </div>
                        

                        <div class="row">
                           <div class="col-12 col-md-6">
                                 <div class="_login_input_group">
                                    <div class="_login_input">
                                       <div class="_login_input_inp">
                                          <Input v-model="formdata.videoLink" placeholder="Video link" type="text" />
                                       </div>
                                    </div>
                                 </div>
                           </div>

                           <div class="col-12 col-md-6">
                                 <div class="_login_input_group">
                                    <div class="_login_input">
                                       <div class="_login_input_inp">
                                          <Input v-model="formdata.price" placeholder="Price" type="number" />
                                       </div>
                                    </div>
                                 </div>
                           </div>
                        </div>
                       <!-- ormdata.openingMassage -->

                        <div class="_login_input_group">
                           <div class="_login_input">
                              <div class="_login_input_inp">
                                 <Input v-model="formdata.openingMassage" placeholder="Opening Massage" type="text" />
                              </div>
                           </div>
                        </div>

                        <div class="_login_input_button">
                           
                           <p class="_banner_post_title"> <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Join Now 2</button></p>
		            	
                           <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
                        </div>
                     </form>
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
                title:'',
                cat_id:'',
                user_id:'',
                price:'',
                videoLink:'',
                description:'',
                openingMassage:'',
                servicingTime:[
                   {
                     startTime:'',
                     endTime:'',
                     day:'Monday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Tuesday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Wednesday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Thursday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Friday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Saturday',
                     duration:'',
                     isOn:'false',
                     },
                   {
                     startTime:'',
                     endTime:'',
                     day:'Sunday',
                     duration:'',
                     isOn:'false',
                     },
                ],
            },

            items:[],
            servicingDayCount : 1,
            itemName:'',
            itemPrice:0,
            ok:0,
            alljobs:'',
            visible: false,
            catagory:'catagory',
      }
    },
    methods:{
        async join(){
            console.log(this.formdata)
            if(this.formdata.openingMassage =='' || this.formdata.description == '' || this.formdata.videoLink == '' || this.formdata.title == '' || this.formdata.price == '' || this.formdata.cat_id == ''){
                this.i("All fields are requrired");
                return;
            }
            for(let item of this.formdata.servicingTime){
               if(item.isOn==true){
                 if(item.startTime=="" || item.endTime == "" || item.duration== ""){
                    return this.e("Please fill the time solts of "+ item.day+" !");
                 }
               }
            }
            // return;
           // this.nextStep = 1
            const res1 = await this.callApi('post', 'insert-all-services',this.formdata)
            if(res1.status===201){
                this.s("Data stored Successfully!");
                this.$router.push({name: 'jobImage',params: {id:res1.data.id}});
             //  console.log(res1)
               
            }
            else if (res1.status===402){
               this.e("You are not Authenticated User!!!")
            }
            else if (res1.status===406){
               for(let e of res1.data.dayError){
                  this.e(e);
               }
            }
            else this.swr();
        },
    },
    async created(){
      console.log("i am auth Information");
		console.log(this.authInfo);
        const res = await this.callApi('get', 'get-all-catgory')
        if(res.status==200){
             this.alljobs = res.data;
        }
        else this.swr();
    }
    

}
</script>

<style>

</style>

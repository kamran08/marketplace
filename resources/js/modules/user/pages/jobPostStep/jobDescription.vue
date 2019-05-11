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
                        <Step title="Service details" content=""></Step>
                        <Step title="Upload Images" content=""></Step>
                        <Step title="Add Extra" content=""></Step>
                        <Step title="Tags" content=""></Step>
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
                                          <!-- hello -->
                                          <Input v-model="formdata.title" placeholder="Job title" type="text" :value="formdata.title"/>
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
                        <!-- coustom edit -->
                         <!-- <div class="row">
                           <div class="col-12 col-md-6">
                              <div class="_login_input_group">
                                 <div class="_login_input">
                                    <div class="_login_input_inp">
                                       <Button @click="fillAllDay">Auto fill</Button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div> -->
                        <!-- coustom edit -->
                         <!-- <div class="row align-items-center _coustom_s">
                                    <div class="col-3 col-md-4">
                                       <TimePicker v-model="tempdata.startTime"  format="HH:mm" type="time" placement="bottom-end" placeholder="Start Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-4">
                                       <TimePicker v-model="tempdata.endTime"   format="HH:mm" type="time" placement="bottom-end" placeholder="End Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-4">
                                       <Input v-model="tempdata.duration" class="_login_input_inp_field"  placeholder="Duration" type="number"></Input>
                                    </div>
                          </div> -->
                        <!-- coustom edit -->

                        <div class="_login_input_group">
                           <div class="_login_input">
                              
                              <div class="_login_input_inp select_time">
                                 <!-- <div class="row">
                                    <div class="col-12 col-md-12 _dis_flex">
                                       <p class="_1steps_input_title" >Service days</p>
                                    </div>
                                 </div> -->

                                 <div class="row align-items-center ss1">
                                    <div class="col-3 col-md-2">
                                      <p class="_1steps_input_title" >Service days</p>
                                    </div>

                                    <div class="col-3 col-md-2">
                                       <p class="_1steps_input_title" >Time From</p>
                                    </div>

                                    <div class="col-3 col-md-2">
                                       <p class="_1steps_input_title" >Until</p>
                                    </div>

                                    <div class="col-3 col-md-4">
                                       <p class="_1steps_input_title" >Apoinment Length in minutes 1hour-60min</p>
                                    </div>
                                 </div>
                                 <!-- test -->
                  
                                 <!-- test -->

                                 <div class="row align-items-center" v-for="(item,index) in formdata.servicingTime" :key="index">
                                    <div class="col-3 col-md-2">
                                      <Checkbox v-model="item.isOn">{{item.day}}</Checkbox>
                                    </div>

                                    <div class="col-3 col-md-2">
                                       <TimePicker v-model="item.startTime" format="HH:mm" type="time" placement="bottom-end" placeholder="Start Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-2">
                                       <TimePicker v-model="item.endTime" format="HH:mm" type="time" placement="bottom-end" placeholder="End Time" ></TimePicker>
                                    </div>

                                    <div class="col-3 col-md-4">
                                       <Input class="_login_input_inp_field" v-model="item.duration" placeholder="Duration" type="number"/>
                                    </div>
                                    <div class="col-3 col-md-2" v-if="index==0">
                                        <Button @click="fillAllDay">Auto fill</Button>
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
                           <!-- <div class="col-12 col-md-6">
                                 <div class="_login_input_group">
                                    <div class="_login_input">
                                       <div class="_login_input_inp">
                                          <Input v-model="formdata.videoLink" placeholder="Video link" type="text" />
                                       </div>
                                    </div>
                                 </div>
                           </div> -->
                           <div class="col-12 col-md-6">
                               
                                 <div class="_login_input">
                                    <div class="_login_input_inp">
                                       <Select  v-model="formdata.serviceType" placeholder="Servive Type">
                                          <Option >In - home based</Option>
                                          <Option >Out - mobile service</Option>
                                          <Option >In/Out Both</Option>
                                       </Select>
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

                    

                        <div class="_login_input_button">
                           
                           <p class="_banner_post_title"> <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Post Service</button></p>
		            	
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
            tempdata:{
                  startTime:'',
                  endTime:'',
                  duration:''
               },
            formdata:{
                title:'',
                cat_id:'',
                user_id:'',
                price:'',
                description:'',
                serviceType:'',
            
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
           
            if(this.formdata.description == '' || this.formdata.title == '' || this.formdata.price == '' || this.formdata.cat_id == ''){
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
                console.log(res1)
               
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
        fillAllDay(){
           if(this.formdata.servicingTime[0].startTime ==''|| this.formdata.servicingTime[0].endTime=='' || this.formdata.servicingTime[0].duration==''){
               this.i('please fill the time field')
           }
         //   else{
         //      this.formdata.startTime = this.formdata.servicingTime[0].startTime
         //      this.formdata.endTime = this.formdata.servicingTime[0].endTime
         //      this.formdata.duration = this.formdata.servicingTime[0].duration
         //   }
           
           
          
           else{
               for(let item of this.formdata.servicingTime){
                  item.isOn=true
                  item.startTime=this.formdata.servicingTime[0].startTime
                  item.endTime = this.formdata.servicingTime[0].endTime
                  item.duration=this.formdata.servicingTime[0].duration
                }
           }
            console.log(this.formdata.servicingTime)
        }
       
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

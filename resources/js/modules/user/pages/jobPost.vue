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

                                <!--~~~~~~~ Steps ~~~~~~~~
                            <div class="_1steps_all">
                                <div class="_1steps">
                                    <div class="_1steps_one _1steps_one_done _1steps_main _1steps_on">
                                        <p class="_1steps_no">1</p>
                                        <i class="fas fa-check"></i>
                                    </div>
                                    <div class="_1steps_two _1steps_main  _1steps_on">
                                        <p class="_1steps_no">2</p>
                                    </div>
                                    <div class="_1steps_three _1steps_main">
                                        <p class="_1steps_no">3</p>
                                    </div>
                                    <div class="_1steps_three _1steps_main">
                                        <p class="_1steps_no">4</p>
                                    </div>
                                    <div class="_1steps_three _1steps_main">
                                        <p class="_1steps_no">Complete</p>
                                    </div>
                                </div>
                            </div>
                                ~~~~~~~ Steps ~~~~~~~~-->
                            
                            <div class="_1steps_all">
                                <Steps :current="LinkFlagTab-1">
                                    <Step title="step 1" content=""></Step>
                                    <Step title="step 2" content=""></Step>
                                    <Step title="step 3" content=""></Step>
                                    <Step title="step 4" content=""></Step>
                                </Steps>
                            </div>

                                <!--~~~~~~~ From ~~~~~~~~~-->
                                <jobDescription v-if="(LinkFlagTab==1)"/>	
                                <jobImage v-if="(LinkFlagTab==2)"/>	
                                <jobExtraService v-if="(LinkFlagTab==3)"/>	
                                <jobTag v-if="(LinkFlagTab==4)"/>	
                                <!--~~~~~~~ From ~~~~~~~~~-->
                        </div>
                    </div>
                </div>
            </div>
        </div>


       </div>
</template>
<script>
import jobExtraService from './jobPostStep/jobExtraService.vue';
import jobDescription from './jobPostStep/jobDescription.vue';
import jobTag from './jobPostStep/jobTag.vue';
import jobImage from './jobPostStep/jobImage.vue';
export default {
    components: {
        jobDescription,
        jobTag,
        jobImage,
        jobExtraService,
    },
    
    data(){
        return{
           

          items:[],
          itemName:'',
          itemPrice:0,
          ok:0,
          alljobs:'',
          visible: false,
          catagory:'catagory'

          
          

        }

    },
   async created(){
       
         
    },
    methods:{
        next(){
            current++;
        }
    }
}
</script>


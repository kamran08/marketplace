<template>
    <div>
        <!-- <div class="row">
            <div class="col-md-4" @click="showUploadModal=true">
                <div class="profile-img">
                    <img :src="BASE_URL+img" alt="user-profile" />
                    <div   class="file btn btn-lg btn-primary">
                        Change Photo
                        
                    </div>
                </div>
            </div>
        </div> -->


    <Rate allow-half v-model="valueHalf" />



 

        <!-- upload modal -->
        <!-- <Modal
            v-model="showUploadModal"
            title="Upload your profile picture"
            :closable = "false"
        >
            <Upload
                type="drag"
                action="/app/upload-avater"
                :on-success="handleSuccess"
                >
                <div style="padding: 20px 0">
                    <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                    <p>Click or drag files here to upload</p>
                </div>
            </Upload>
                <div slot="footer">
                    <Button @click="showUploadModal=false">Close</Button>
                </div>
        </Modal>  -->
    </div>
</template>
<script>


    export default {
      
        components: {
            
            
        },
        data() {
            return {
                  valueHalf: 4,
                BASE_URL:'http://bookingmarket.test/',
                linkFlag: 1,
                user: [],
                showUploadModal:false,
                img: 'uploads/_85730600_monkey2.jpg',
                ok:''

            }
        },

        computed: {

        },
        created() {
            // Do something useful with the data in the template
            // console.log(this.gid)


        },

        methods: {
             handleChange(e) {
                if (e.key == 'Enter') {
                console.log('test');
            }},
             add(e) {
                    console.log(e)
                    this.ok=''
             },

       
             handleSuccess (res, file) {
                console.log(res)
                this.img = `/uploads/${res}`
                console.log(this.img)
                this.showUploadModal = false
            },
            


        },

    }
    
</script>
<template>
    <div style="background:#eee;padding: 20px">
        <Card :bordered="false">
            <p slot="title" class="green">Success!</p>
            <p>Your account has been activated successfully!. </p>
            <p class="_link" @click="$router.push('/login')">Click here to login</p>
        </Card>
    </div>
</template>
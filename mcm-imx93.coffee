deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

postProvisioningInstructions = [
]
 
module.exports =
        version: 1
        slug: 'mcm-imx93'
        name: 'Compulab MCM-iMX93 Devkit'
        arch: 'aarch64'
 
        stateInstructions:
                postProvisioning: postProvisioningInstructions
 
        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'http://docs.balena.io/mcm-imx93/nodejs/getting-started/#adding-your-first-device'
                osx: 'http://docs.balena.io/mcm-imx93/getting-started/#adding-your-first-device'
                linux: 'http://docs.balena.io/mcm-imx93/getting-started/#adding-your-first-device'

        supportsBlink: false

        yocto:
                machine: 'mcm-imx93'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-scarthgap'
                deployArtifact: 'balena-image-flasher-mcm-imx93.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization

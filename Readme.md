# Simulation
This document is used to introduce the detail of the simulation.

## Contents
* [The Introduction of the Simulation Object](#Introduction)
    - [The Structure of the Chemical Reactor Control System](#Introduction.Structure)
    - [The Product of the Chemical Reactor Control System](#Introduction.Product)
    - [The Processes of the Chemical Reactor Control System](#Introduction.Processes)
    - [The Functions of the Chemical Reactor Control System](#Introduction.Functions)
* [Risk Modelling of the Chemical Reactor Control System](#Risk Modelling)
    - [Analysis of Potential Malicious Attacks](#Risk Modelling.Attack Analysis)
    - [Analysis of Potential Hazardous Incident](#Risk Modelling.Incident Analysis)
    - [Analysis of Asset](#Risk Modelling.Asset Analysis)


##<h2 id="Introduction" />The Introduction of the Simulation Object
###<h3 id="Introduction.Structure" />The Structure of the Chemical Reactor Control System

The simulation object is a chemical reactor control system which is shown as following figure.

&#8194;&#8194;<img src="/Figures/Structure.of.Reactor.Control.System.png" alt="Structure of Reactor Control System" />

This control network contains three layers:

* Management Layer,
* Control Layer,
* Physical Layer.

In the management layer, there are three personal computers and a web server. All the network devices connect to the Ethernet, which connects the internet via a security gateway.

In the control layer, there are three sub networks: Industrial Ethernet 1, 2, 3. In the sub network "Industrial Ethernet 1", three are a engineer state, a data server, and four PLCs. The sub network "Industrial Ethernet 1" connects the management layer via a security gateway. The remaining two sub networks are same as the sub network "Industrial Ethernet 1", so in this section, their details will not be introduced.

In the physical layer, there are a distillation column and two reactor. In the distillation column, the material is separated into two semi-product. One semi-product is the input of reactor 1, and is fixed in the product with another material. The other semi-product is transported into the reactor 2, and is fixed in the other product.

###<h3 id="Introduction.Product" />The Product of the Chemical Reactor Control System</h3>
The semi-product and product of this chemical reactor control system is shown as follows.

Symbol | Description
:---   | :---
`s01`  | the semi-product which is the output from the top of the distillation column
`s02`  | the semi-product which is the other outputs from the bottom of the distillation column
`s03`  | the product which is the output from the reactor 1
`s04`  | the product which is the output from the reactor 2

<h3 id="Introduction.Processes">The Processes of the Chemical Reactor Control System</h3>
The processes of this chemical reactor control system are shown as follows.

Symbol | Description
:---   | :---
`p01`  | the distillation, which can seperate the material into two semi-product `s01` and `s02`
`p02`  | the mixed heating, which can generate the product by heating semi-product `s01` and the other material
`p03`  | the heating, which can produce the other product by heating the semi-product `s02`

So, the process model of this chemical reactor control system is shown as following figure.

&#8194;&#8194;<img src="/Figures/Process.Model.of.Reactor.Control.System.png" width = "250" alt="Process Model of Reactor Control System" />

<h3 id="Introduction.Functions">The Functions of the Chemical Reactor Control System</h3>
The symbols in the physical layer are shown as follows.

Symbol | Description
:---   | :---
`V1`   | the valve of input of distillation column
`V2`   | the valve of output `s01` of distillation column
`V3`   | the valve of output `s02` of distillation column
`V4`   | the valve of input material of reactor 1
`V5`   | the valve of input `s01` of reactor 1
`V6`   | the valve of input `s02` of reactor 2
`V7`   | the valve of output `s03` of reactor 1
`V8`   | the pressure reducing valve of reactor 1
`V9`   | the pressure reducing valve of reactor 2
`V10`  | the valve of output `s04` of reactor 2
`S1`   | the switch of the heater of the distillation column
`S2`   | the switch of the heater of the reactor 1
`S3`   | the switch of the heater of the reactor 2
`PS1`  | the pressure sensor of the distillation column
`PS2`  | the pressure sensor of the reactor 1
`PS3`  | the pressure sensor of the reactor 2
`TS1`  | the temperature sensor of the distillation column
`TS2`  | the temperature sensor of the reactor 1
`TS3`  | the temperature sensor of the reactor 2
`LS1`  | the level sensor of the reactor 1
`LS2`  | the level sensor of the reactor 2
`B`    | the blender of reactor 2
`M`    | the motor which drives the blender `B`

The functions of this chemical reactor control system are shown as follows.

* The functions of distillation column:

Symbol | Description                                                | Failure Inducement
:---   | :---                                                       | :---
`f01`  | the temperature control function of distillation column    | failure of `f03`, `f05`, `f06`, `f07`
`f02`  | the pressure control function of distillation column       | failure of `f04`, `f06`, `f08`
`f03`  | the traffic control function of `V1`                       | launch of `a23`, `a35`
`f04`  | the traffic control function of `V2`                       | launch of `a26`, `a38`
`f05`  | the traffic control function of `V3`                       | launch of `a26`, `a38`
`f06`  | the switch control function of `S1`                        | launch of `a24`, `a36`
`f07`  | the temperature sensation function of distillation column  | launch of `a25`, `a37`
`f08`  | the pressure sensation function of distillation column     | launch of `a25`, `a37`

* The functions of reactor 1:

Symbol | Description                                                | Failure Inducement
:---   | :---                                                       | :---
`f09`  | the temperature control function of reactor 1              | failure of `f12`, `f13`, `f14`, `f16`, `f17`
`f10`  | the pressure control function of reactor 1                 | failure of `f15`, `f16`, `f18`
`f11`  | the level control function of reactor 1                    | failure of `f12`, `f13`, `f14`, `f19`
`f12`  | the traffic control function of `V4`                       | launch of `a27`, `a39`
`f13`  | the traffic control function of `V5`                       | launch of `a27`, `a39`
`f14`  | the traffic control function of `V7`                       | launch of `a30`, `a42`
`f15`  | the pressure reducing function of reactor 1                | launch of `a30`, `a42`
`f16`  | the switch control function of `S2`                        | launch of `a28`, `a40`
`f17`  | the temperature sensation function of reactor 1            | launch of `a29`, `a41`
`f18`  | the pressure sensation function of reactor 1               | launch of `a29`, `a41`
`f19`  | the level sensation function of reactor 1                  | launch of `a29`, `a41`

* The functions of reactor 2:

Symbol | Description                                                | Failure Inducement
:---   | :---                                                       | :---
`f20`  | the temperature control function of reactor 2              | failure of `f23`, `f24`, `f26`, `f27`
`f21`  | the pressure control function of reactor 2                 | failure of `f25`, `f26`, `f28`
`f22`  | the level control function of reactor 2                    | failure of `f23`, `f24`, `f29`
`f23`  | the traffic control function of `V6`                       | launch of `a31`, `a43`
`f24`  | the traffic control function of `V10`                      | launch of `a34`, `a46`
`f25`  | the pressure reducing function of reactor 2                | launch of `a34`, `a46`
`f26`  | the switch control function of `S3`                        | launch of `a32`, `a44`
`f27`  | the temperature sensation function of reactor 2            | launch of `a33`, `a45`
`f28`  | the pressure sensation function of reactor 2               | launch of `a33`, `a45`
`f29`  | the level sensation function of reactor 2                  | launch of `a33`, `a45`
`f30`  | the mixing function of reactor 2                           | launch of `a32`, `a44`

<h2 id="Risk Modelling">Risk Modelling of the Chemical Reactor Control System</h2>
<h3 id="Risk Modelling.Attack Analysis">Analysis of Potential Malicious Attacks</h3>
The potential attacks are shown as follows.

Symbol | Description                                                        | Condition
:---   | :---                                                               | :---
`a01`  | network scanning of the Ethernet in the management layer           | --
`a02`  | vulnerability scanning of the devices in the management layer      | launch of `a01`
`a03`  | buffer overflow attack on the web server                           | launch of `a02`
`a04`  | brute force attack on the web server                               | launch of `a02`
`a05`  | brute force attack on the personal computer 1                      | launch of `a02`
`a06`  | brute force attack on the personal computer 2                      | launch of `a02`
`a07`  | brute force attack on the personal computer 3                      | launch of `a02`
`a08`  | network scanning of the industrial Ethernet 1 in the control layer | launch of `a03`, `a04`, `a05`, `a06`, `a07`
`a09`  | vulnerability scanning of the devices in the industrial Ethernet 1 | launch of `a08`
`a10`  | buffer overflow attack on the data server 1                        | launch of `a09`
`a11`  | brute force attack on the data server 1                            | launch of `a09`
`a12`  | brute force attack on the engineer station 1                       | launch of `a09`
`a13`  | network scanning of the industrial Ethernet 2 in the control layer | launch of `a03`, `a04`, `a05`, `a06`, `a07`
`a14`  | vulnerability scanning of the devices in the industrial Ethernet 2 | launch of `a13`
`a15`  | buffer overflow attack on the data server 2                        | launch of `a14`
`a16`  | brute force attack on the data server 2                            | launch of `a14`
`a17`  | brute force attack on the engineer station 2                       | launch of `a14`
`a18`  | network scanning of the industrial Ethernet 3 in the control layer | launch of `a03`, `a04`, `a05`, `a06`, `a07`
`a19`  | vulnerability scanning of the devices in the industrial Ethernet 3 | launch of `a18`
`a20`  | buffer overflow attack on the data server 3                        | launch of `a19`
`a21`  | brute force attack on the data server 3                            | launch of `a19`
`a22`  | brute force attack on the engineer station 3                       | launch of `a19`
`a23`  | DoS attack on PLC1                                                 | launch of `a10`, `a11`, `a12`
`a24`  | DoS attack on PLC2                                                 | launch of `a10`, `a11`, `a12`
`a25`  | DoS attack on PLC3                                                 | launch of `a10`, `a11`, `a12`
`a26`  | DoS attack on PLC4                                                 | launch of `a10`, `a11`, `a12`
`a27`  | DoS attack on PLC5                                                 | launch of `a15`, `a16`, `a17`
`a28`  | DoS attack on PLC6                                                 | launch of `a15`, `a16`, `a17`
`a29`  | DoS attack on PLC7                                                 | launch of `a15`, `a16`, `a17`
`a30`  | DoS attack on PLC8                                                 | launch of `a15`, `a16`, `a17`
`a31`  | DoS attack on PLC9                                                 | launch of `a20`, `a21`, `a22`
`a32`  | DoS attack on PLC10                                                | launch of `a20`, `a21`, `a22`
`a33`  | DoS attack on PLC11                                                | launch of `a20`, `a21`, `a22`
`a34`  | DoS attack on PLC12                                                | launch of `a20`, `a21`, `a22`
`a35`  | man-in-the-middle attack on PLC1                                   | launch of `a12`
`a36`  | man-in-the-middle attack on PLC2                                   | launch of `a12`
`a37`  | man-in-the-middle attack on PLC3                                   | launch of `a12`
`a38`  | man-in-the-middle attack on PLC4                                   | launch of `a12`
`a39`  | man-in-the-middle attack on PLC5                                   | launch of `a17`
`a40`  | man-in-the-middle attack on PLC6                                   | launch of `a17`
`a41`  | man-in-the-middle attack on PLC7                                   | launch of `a17`
`a42`  | man-in-the-middle attack on PLC8                                   | launch of `a17`
`a43`  | man-in-the-middle attack on PLC9                                   | launch of `a22`
`a44`  | man-in-the-middle attack on PLC10                                  | launch of `a22`
`a45`  | man-in-the-middle attack on PLC11                                  | launch of `a22`
`a46`  | man-in-the-middle attack on PLC12                                  | launch of `a22`

<h3 id="Risk Modelling.Incident Analysis">Analysis of Potential Hazardous Incident</h3>
The potential hazardous incident are shown as follows.

Symbol | Description            | Location              | Inducement
:---   | :---                   | :---                  | :---
`e01`  | pressure anomaly       | distillation column   | failure of `f02`
`e02`  | temperature anomaly    | distillation column   | failure of `f01`
`e03`  | traffic of anomaly     | distillation column   | failure of `f03`, `f04`, `f05`
`e04`  | excessive pressure     | reactor 1             | failure of `f10`
`e05`  | low pressure           | reactor 1             | failure of `f10`
`e06`  | temperature anomaly    | reactor 1             | failure of `f09`
`e07`  | excessive liquid level | reactor 1             | failure of `f11`
`e08`  | low liquid level       | reactor 1             | failure of `f11`
`e09`  | explosion              | reactor 1             | occurrence of `e04`
`e10`  | heater dry fired       | reactor 1             | occurrence of `e08`
`e11`  | liquid overflow        | reactor 1             | occurrence of `e07`
`e12`  | excessive pressure     | reactor 2             | failure of `f21`
`e13`  | low pressure           | reactor 2             | failure of `f21`
`e14`  | temperature anomaly    | reactor 2             | failure of `f20`
`e15`  | excessive liquid level | reactor 2             | failure of `f22`
`e16`  | low liquid level       | reactor 2             | failure of `f22`
`e17`  | explosion              | reactor 2             | occurrence of `e12`
`e18`  | heater dry fired       | reactor 2             | occurrence of `e16`
`e19`  | liquid overflow        | reactor 2             | occurrence of `e15`
`e20`  | blender stop           | reactor 2             | failure of `f30`

<h3 id="Risk Modelling.Asset Analysis">Analysis of Asset</h3>
The asset of the chemical reactor control system and the relationship between asset and potential hazardous incident are shown as follows.

Symbol | Description                            | Value($)  | Hazardous Incident
:---   | :---                                   |      ---: | :---
`x01`  | semi-product `s01` and `s02`           |  30000    | `e01`,`e02`,`e03`
`x02`  | product `s03`                          |  60000    | `e06`,`e09`,`e11`
`x03`  | product `s04`                          |  70000    | `e14`,`e17`,`e20`
`x04`  | tank and sensors of reactor 1          | 200000    | `e09`
`x05`  | heater of reactor 1                    |  40000    | `e09`,`e10`
`x06`  | tank, sensors and blender of reactor 2 | 300000    | `e17`
`x07`  | heater of reactor 2                    |  50000    | `e17`,`e18`
`x08`  | staff 1-4                              | 800000    | `e09`,`e11`
`x09`  | staff 5-9                              | 100000    | `e17`,`e19`
`x10`  | river and solid                        | 900000    | `e09`,`e11`,`e17`,`e19`
`x11`  | air                                    | 400000    | `e09`,`e17`
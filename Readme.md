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


<h2 id="Introduction">The Introduction of the Simulation Object</h2>
<h3 id="Introduction.Structure">The Structure of the Chemical Reactor Control System</h3>

The simulation object is a chemical reactor control system which is shown as following figure.

&#8194;&#8194;<img src="/Figures/Structure.of.Reactor.Control.System.png" alt="Structure of Reactor Control System" />

This control network contains three layers:

* Management Layer,
* Control Layer,
* Physical Layer.

In the management layer, there are three personal computers and a web server. All the network devices connect to the Ethernet, which connects the internet via a security gateway.

In the control layer, there are three sub networks: Industrial Ethernet 1, 2, 3. In the sub network "Industrial Ethernet 1", three are a engineer state, a data server, and four PLCs. The sub network "Industrial Ethernet 1" connects the management layer via a security gateway. The remaining two sub networks are same as the sub network "Industrial Ethernet 1", so in this section, their details will not be introduced.

In the physical layer, there are a distillation column and two reactor. In the distillation column, the material is separated into two semi-product. One semi-product is the input of reactor 1, and is fixed in the product with another material. The other semi-product is transported into the reactor 2, and is fixed in the other product.

<h3 id="Introduction.Product">The Product of the Chemical Reactor Control System</h3>
The semi-product and product of this chemical reactor control system is shown as follows.

Symbol | Description
:---   | :---
`s1`   | the semi-product which is the output from the top of the distillation column.
`s2`   | the semi-product which is the other outputs from the bottom of the distillation column.
`s3`   | the product which is the output from the reactor 1.
`s4`   | the product which is the output from the reactor 2.

<h3 id="Introduction.Processes">The Processes of the Chemical Reactor Control System</h3>
The processes of this chemical reactor control system are shown as follows.

Symbol | Description
:---   | :---
`p1`   | the distillation, which can seperate the material into two semi-product `s1` and `s2`.
`p2`   | the mixed heating, which can generate the product by heating semi-product `s1` and the other material.
`p3`   | the heating, which can produce the other product by heating the semi-product `s2`.

So, the process model of this chemical reactor control system is shown as following figure.

&#8194;&#8194;<img src="/Figures/Process.Model.of.Reactor.Control.System.png" width = "250" alt="Process Model of Reactor Control System" />

<h3 id="Introduction.Functions">The Functions of the Chemical Reactor Control System</h3>
The symbols in the physical layer are shown as follows.

Symbol | Description
:---   | :---
`V1`   | the valve of input of distillation column.
`V2`   | the valve of output `s1` of distillation column.
`V3`   | the valve of output `s2` of distillation column.
`V4`   | the valve of input material of reactor 1.
`V5`   | the valve of input `s1` of reactor 1.
`V6`   | the valve of input `s2` of reactor 2.
`V7`   | the valve of output `s3` of reactor 1.
`V8`   | the pressure reducing valve of reactor 1.
`V9`   | the pressure reducing valve of reactor 2.
`V10`  | the valve of output `s4` of reactor 2.
`S1`   | the switch of the heater of the distillation column.
`S2`   | the switch of the heater of the reactor 1.
`S3`   | the switch of the heater of the reactor 2.
`PS1`  | the pressure sensor of the distillation column.
`PS2`  | the pressure sensor of the reactor 1.
`PS3`  | the pressure sensor of the reactor 2.
`TS1`  | the temperature sensor of the distillation column.
`TS2`  | the temperature sensor of the reactor 1.
`TS3`  | the temperature sensor of the reactor 2.
`LS1`  | the level sensor of the reactor 1.
`LS2`  | the level sensor of the reactor 2.
`B`    | the blender of reactor 2.
`M`    | the motor which drives the blender `B`.

The functions of this chemical reactor control system are shown as follows.

* The functions of distillation column:

Symbol | Description
:---   | :---
`f1`   | the temperature control function of distillation column.
`f2`   | the pressure control function of distillation column.
`f3`   | the traffic control function of `V1`.
`f4`   | the traffic control function of `V2`.
`f5`   | the traffic control function of `V3`.
`f6`   | the switch control function of `S1`.
`f7`   | the temperature sensation function of distillation column.
`f8`   | the pressure sensation function of distillation column.

* The functions of reactor 1:

Symbol | Description
:---   | :---
`f9`   | the temperature control function of reactor 1.
`f10`  | the pressure control function of reactor 1.
`f11`  | the level control function of reactor 1.
`f12`  | the traffic control function of `V4`.
`f13`  | the traffic control function of `V5`.
`f14`  | the traffic control function of `V7`.
`f15`  | the pressure reducing function of reactor 1.
`f16`  | the switch control function of `S2`.
`f17`  | the temperature sensation function of reactor 1.
`f18`  | the pressure sensation function of reactor 1.
`f19`  | the level sensation function of reactor 1.

* The functions of reactor 2:

Symbol | Description
:---   | :---
`f20`  | the temperature control function of reactor 2.
`f21`  | the pressure control function of reactor 2.
`f22`  | the level control function of reactor 2.
`f23`  | the traffic control function of `V6`.
`f24`  | the traffic control function of `V10`.
`f25`  | the pressure reducing function of reactor 2.
`f26`  | the switch control function of `S3`.
`f27`  | the temperature sensation function of reactor 2.
`f28`  | the pressure sensation function of reactor 2.
`f29`  | the level sensation function of reactor 2.
`f30`  | the mixing function of reactor 2.

<h2 id="Risk Modelling">Risk Modelling of the Chemical Reactor Control System</h2>
<h3 id="Risk Modelling.Attack Analysis">Analysis of Potential Malicious Attacks</h3>
The potential attacks are shown as follows.

Symbol | Description
:---   | :---
`a1`   | network scanning of the Ethernet in the management layer.
`a2`   | vulnerability scanning of the devices in the management layer.
`a3`   | buffer overflow attack on the web server.
`a4`   | brute force attack on the web server.
`a5`   | brute force attack on the personal computer 1.
`a6`   | brute force attack on the personal computer 2.
`a7`   | brute force attack on the personal computer 3.
:---   | :---
`a8`   | network scanning of the industrial Ethernet 1 in the control layer.
`a9`   | vulnerability scanning of the devices in the industrial Ethernet 1.
`a10`  | buffer overflow attack on the data server 1.
`a11`  | brute force attack on the data server 1.
`a12`  | brute force attack on the engineer station 1.
:---   | :---
`a13`  | network scanning of the industrial Ethernet 2 in the control layer.
`a14`  | vulnerability scanning of the devices in the industrial Ethernet 2.
`a15`  | buffer overflow attack on the data server 2.
`a16`  | brute force attack on the data server 2.
`a17`  | brute force attack on the engineer station 2.
:---   | :---
`a18`  | network scanning of the industrial Ethernet 3 in the control layer.
`a19`  | vulnerability scanning of the devices in the industrial Ethernet 3.
`a20`  | buffer overflow attack on the data server 3.
`a21`  | brute force attack on the data server 3.
`a22`  | brute force attack on the engineer station 3.
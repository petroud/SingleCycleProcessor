# Single Cycle Processor
The project focuses on the implementation of a Single Cycle Processor with a MIPS-like ISA x32. The processor breaks into 3 main parts:
<ol>
  <li>DATAPATH</li>  The <strong>datapath</strong> consists of 4 stages. Generally datapath is responsible for performing logical and arithmetic operations, keeping record of the program counter register and the register file, breaking instructions into parts that are later transformed into control signals and handling memory transactions. <br>
    
  <li>CONTROL</li>  The <strong>control</strong> module is responsible for identifying the incoming instructions and producing the appropriate control signals that are driven into datapath. <br>
  <li>MEMORY</li>  The <strong>memory</strong> consists of 2048 memory 11bit long addresses. Each of them can store data up to 32 bits alligned by 4 bytes per address. 
</ol> <br>

Further information can be found under the report file in the PDF document.

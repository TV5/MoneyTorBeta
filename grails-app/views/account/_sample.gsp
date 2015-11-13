<h3>Hello</h3>

<g:each in="${payableList}" var="payable">
        
            <h3>${payable.amount}, ${payable.updated_on}</h3>
            
            <br/>
        </g:each>
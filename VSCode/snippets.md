### Snippet (fl-rscp)
```
	"React Functional Component + state, effect and propTypes": {
		"prefix": "fl-rscp",
		"body": [
			"import React, { useState, useEffect } from 'react';",
			"import PropTypes from 'prop-types';",
			"",
			"const $TM_FILENAME_BASE = (props) => {",
			"  const [ isLoading, setIsLoading ] = useState(true);",
			"",
			"  useEffect(() => {",
			"  // Documentation hooks as lifecycle-methods:",
			"  // https://dev.to/trentyang/replace-lifecycle-with-hooks-in-react-3d4n",
			"  }, []);",
			"",
			"  return (",
			"    <div>",
			"      <h1>Snippet(fl-rscp)</h1>",
			"    </div>",
			"  );",
			"};",
			"",
			"$TM_FILENAME_BASE.propTypes = {",
			"// Documentation propTypes:",
			"// https://reactjs.org/docs/typechecking-with-proptypes.html",
			"};",
			"",
			"export default $TM_FILENAME_BASE;"
		],
		"description": "React/func/state/effect/prop"
	},
```
### Example
```Javascript
import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

const Example = (props) => {
  const [ isLoading, setIsLoading ] = useState(true);

  useEffect(() => {
  // Documentation hooks as lifecycle-methods:
  // https://dev.to/trentyang/replace-lifecycle-with-hooks-in-react-3d4n
  }, []);

  return (
    <div>
      <h1>Snippet(fl-rscp)</h1>
    </div>
  );
};

Example.propTypes = {
// Documentation propTypes:
// https://reactjs.org/docs/typechecking-with-proptypes.html
};

export default Example;
```
### Snippet (fl-rsc)
```
	"React Functional Component + state and effect": {
		"prefix": "fl-rsc",
		"body": [
			"import React, { useState, useEffect } from 'react';",
			"",
			"const $TM_FILENAME_BASE = (props) => {",
			"  const [ isLoading, setIsLoading ] = useState(true);",
			"",
			"  useEffect(() => {",
			"  // Documentation hooks as lifecycle-methods:",
			"  // https://dev.to/trentyang/replace-lifecycle-with-hooks-in-react-3d4n",
			"  }, []);",
			"",
			"  return (",
			"    <div>",
			"      <h1>Snippet(fl-rsc)</h1>",
			"    </div>",
			"  );",
			"};",
			"",
			"export default $TM_FILENAME_BASE;"
		],
		"description": "React/func/state/effect"
	},
```
### Example
```Javascript
import React, { useState, useEffect } from 'react';

const Example = (props) => {
  const [ isLoading, setIsLoading ] = useState(true);

  useEffect(() => {
  // Documentation hooks as lifecycle-methods:
  // https://dev.to/trentyang/replace-lifecycle-with-hooks-in-react-3d4n
  }, []);

  return (
    <div>
      <h1>Snippet(fl-rsc)</h1>
    </div>
  );
};

export default Example;
```

var header = $("meta[name='_csrf_header']").attr('content');
var token = $("meta[name='_csrf']").attr('content');

var imgList= [];

class UploadAdapter {
	constructor(loader) {
		this.loader = loader;
	}

	upload() {
		return this.loader.file.then(file => new Promise(((resolve, reject) => {
			this._initRequest();
			this._initListeners(resolve, reject, file);
			this._sendRequest(file);
		})))
	}

	_initRequest() {
		const xhr = this.xhr = new XMLHttpRequest();
		xhr.open('POST', '/community/content/img', true);
		xhr.setRequestHeader(header, token);
		xhr.responseType = 'json';
	}

	_initListeners(resolve, reject, file) {
		const xhr = this.xhr;
		const loader = this.loader;
		const genericErrorText = '파일을 업로드 할 수 없습니다.'

		xhr.addEventListener('error', () => { reject(genericErrorText) })
		xhr.addEventListener('abort', () => reject())
		xhr.addEventListener('load', () => {
			const response = xhr.response
			if (!response || response.error) {
				return reject(response && response.error ? response.error.message : genericErrorText);
			}
			imgList.push(response.url);

			resolve({
				default: response.url
			})
		})
	}

	_sendRequest(file) {
		const data = new FormData()
		data.append('upload', file)
		this.xhr.send(data)
	}
}

function MyCustomUploadAdapterPlugin(editor) {
	editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
		return new UploadAdapter(loader)
	}
}

ClassicEditor
	.create(document.querySelector('#update_content'),{
		language:'ko',
		extraPlugins: [MyCustomUploadAdapterPlugin],
		toolbar: {
            items: [
                'heading',
                'bold',
                'italic',
				'link',
                'bulletedList',
                'numberedList',
                'imageUpload',
                'blockquote',
                'MediaEmbed',
                'undo',
                'redo'
            ]
        }
		
	})
	.then(editor => {
		$(".ck-editor").addClass("w-100");

		//(editor);
	})
	.catch(error => {
		console.error(error);
	});

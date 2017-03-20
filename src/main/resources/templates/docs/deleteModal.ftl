
<#if user??>
    <!-- deleteModal -->
    <div class="modal fade" id="deleteModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">提示消息！</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>是否确定删除  【{{deleteModel.title}}】 吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" ng-click="deleteModel.deleteCallback()" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</#if>